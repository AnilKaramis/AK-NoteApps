//
//  NoteScreenViewController.swift
//  AK-NotesApp
//
//  Created by AnılKaramış on 16.10.2024.
//

import UIKit
import SnapKit

class NotesScreenViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let headerLabel = UILabel()
    private let createNoteButton = UIButton(type: .system)
    
    private let listNotesButton = UIButton(type: .system)
    private let galleryNotesButton = UIButton(type: .system)
    
    private let optionsMenuToolbar = UIToolbar()

    lazy private var notesCollection: UICollectionView = {
        let layout = viewModel.noteLayoutType.layout
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private let viewModel: NotesScreenViewModel
    
    // MARK: - Inits
    
    init(with viewModel: NotesScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        bindToViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateHeader()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupBackBarButtonItem()
    }
    
    // MARK: - Actions
    
    @objc
    private func handleAddNoteButton() {
        viewModel.createNote()
    }
    
    @objc
    private func handleListNotesButton() {
        listNotesButton.tintColor = .selectedLayoutButton
        galleryNotesButton.tintColor = .layoutButton
        viewModel.setListLayout()
    }
    
    @objc
    private func handleGalleryNotesButton() {
        galleryNotesButton.tintColor = .selectedLayoutButton
        listNotesButton.tintColor = .layoutButton
        viewModel.setGalleryLayout()
    }

    @objc
    private func handleDeleteSwipe(_ gesture: UISwipeGestureRecognizer) {
        let location = gesture.location(in: notesCollection)
        let indexPath = notesCollection.indexPathForItem(at: location)
        viewModel.swipeNote(with: indexPath)
    }
    
    @objc
    private func handleDeleteNoteFromToolbar() {
        print("DELETE FROM TOOLBAR")
    }
    
    // MARK: - Private methods
    
    private func deleteNoteFromHomeScreen(_ indexPath: IndexPath) {
        viewModel.deleteItemFromArray(with: indexPath.item)
        notesCollection.deleteItems(at: [indexPath])
    }
    
    //  MARK: - Setup
    
    private func setup() {
        setupSuperView()
        setupHeaderLabel()
        setupListNotesButton()
        setupGalleryNotesButton()
        setupNotesCollection()
        setupCreateNoteButton()
        setupDeleteSwipeGesture()
        setupOptionsMenuToolbar()
    }
    
    private func setupSuperView() {
        view.backgroundColor = .backgroundApp
    }
    
    private func setupHeaderLabel() {
        view.addSubview(headerLabel)
        
        headerLabel.textColor = .headerText
        headerLabel.textAlignment = .left
        headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(50)
        }
    }
    
    private func setupListNotesButton() {
        view.addSubview(listNotesButton)
        
        listNotesButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        listNotesButton.tintColor = .selectedLayoutButton
        listNotesButton.addTarget(self, action: #selector(handleListNotesButton), for: .touchUpInside)
        
        listNotesButton.snp.makeConstraints { make in
            make.bottom.equalTo(headerLabel).inset(1.5)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setupGalleryNotesButton() {
        view.addSubview(galleryNotesButton)

        galleryNotesButton.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        galleryNotesButton.tintColor = .layoutButton
        galleryNotesButton.addTarget(self, action: #selector(handleGalleryNotesButton), for: .touchUpInside)
        
        galleryNotesButton.snp.makeConstraints { make in
            make.bottom.equalTo(headerLabel)
            make.trailing.equalTo(listNotesButton.snp.leading).offset(-13)
        }
    }
    
    private func setupNotesCollection() {
        view.addSubview(notesCollection)
        
        notesCollection.backgroundColor = .clear
        notesCollection.clipsToBounds = true
        notesCollection.showsVerticalScrollIndicator = false
        notesCollection.dataSource = self
        notesCollection.delegate = self
        notesCollection.register(NoteViewCell.self, forCellWithReuseIdentifier: NoteViewCell.identifier)
        
        notesCollection.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupCreateNoteButton() {
        view.addSubview(createNoteButton)
        
        createNoteButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        createNoteButton.imageView?.layer.transform = CATransform3DMakeScale(1, 1, 1)
        createNoteButton.tintColor = .white
        createNoteButton.backgroundColor = .appColor
        createNoteButton.layer.cornerRadius = 65 / 2
        createNoteButton.addTarget(self, action: #selector(handleAddNoteButton), for: .touchUpInside)
        
        createNoteButton.snp.makeConstraints { make in
            make.height.width.equalTo(65)
            make.trailing.bottom.equalToSuperview().inset(40)
        }
    }
    
    private func setupOptionsMenuToolbar() {
        view.addSubview(optionsMenuToolbar)
        
        let width = view.bounds.width * 0.6
        let height: CGFloat = 48
        
        optionsMenuToolbar.frame.size.width = width
        optionsMenuToolbar.frame.size.height = height
        optionsMenuToolbar.frame.origin.x = view.bounds.width / 2 - width / 2
        optionsMenuToolbar.frame.origin.y = view.bounds.height * 0.88
        optionsMenuToolbar.layer.masksToBounds = true
        optionsMenuToolbar.layer.cornerRadius = 10
        
        let flexibleSpaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let deleteBarButton = UIBarButtonItem(customView: setupDeleteNoteStackView())
        optionsMenuToolbar.items = [flexibleSpaceBarButton, deleteBarButton, flexibleSpaceBarButton]
    }
    
    private func setupDeleteNoteStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [setupDeleteNoteImageView(), setupDeleteNoteLabel()])
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        let deleteTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDeleteNoteFromToolbar))
        stackView.addGestureRecognizer(deleteTapGesture)
        
        return stackView
    }
    
    private func setupDeleteNoteImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "trash")
        imageView.tintColor = .systemRed
        
        return imageView
    }
    
    private func setupDeleteNoteLabel() -> UILabel {
        let label = UILabel()
        
        label.text = "Delete"
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }
    
    private func setupDeleteSwipeGesture() {
        let deleteSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleDeleteSwipe))
        deleteSwipeGesture.direction = .left
        notesCollection.addGestureRecognizer(deleteSwipeGesture)
    }
    
    private func setupBackBarButtonItem() {
        let backBarButtonItem = UIBarButtonItem(title: "Notes", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .appColor
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
}

// MARK: - UICollectionViewDataSource

extension NotesScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteViewCell.identifier, for: indexPath) as? NoteViewCell else {
            return NoteViewCell()
        }
        
        cell.configure(with: viewModel.cellViewModels[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension NotesScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.editNote(at: indexPath.item)
 
