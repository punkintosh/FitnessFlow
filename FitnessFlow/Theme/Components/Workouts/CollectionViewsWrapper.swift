//
//  CollectionViewsWrapper.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-26.
//

import UIKit

class CollectionViewsWrapper {
    
    static func workoutLevelCardCollection(registerClass: AnyClass, cellIdentifier: String) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(registerClass, forCellWithReuseIdentifier: cellIdentifier)
        return collectionView
    }
    
    static func workoutCardCollection(registerClass: AnyClass, cellIdentifier: String) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(registerClass, forCellWithReuseIdentifier: cellIdentifier)
        return collectionView
    }
    
}
