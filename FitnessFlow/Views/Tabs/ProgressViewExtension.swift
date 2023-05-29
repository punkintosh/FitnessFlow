//
//  ProgressViewExtension.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-29.
//

import UIKit


protocol ProgressViewExtension: AnyObject {
    func didSelectWorkout(cardModel: CardModel)
}

extension ProgressView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewFitnessRecord {
            return fitnessRecordCards.count
        } else if collectionView == collectionViewHealthRecord {
            return healthRecordCards.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutLevelCardCell", for: indexPath) as! WorkoutLevelCardCell
        
        if collectionView == collectionViewFitnessRecord {
            let card = fitnessRecordCards[indexPath.item]
            cell.configure(card: card)
        } else if collectionView == collectionViewHealthRecord {
            let card = healthRecordCards[indexPath.item]
            cell.configure(card: card)
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust the card size according to your needs
        let cardWidth = collectionView.frame.width * 0.7
        let cardHeight = collectionView.frame.height
        return CGSize(width: cardWidth, height: cardHeight)
    }
    
    // MARK: - Card Select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedCard: CardModel?
        if collectionView == collectionViewFitnessRecord {
            selectedCard = fitnessRecordCards[indexPath.item]
        } else if collectionView == collectionViewHealthRecord {
            selectedCard = healthRecordCards[indexPath.item]
        }
        
        if let cardModel = selectedCard {
            selectionDelegate?.didSelectWorkout(cardModel: cardModel)
        }
    }
}

