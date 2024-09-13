//
//  KeyboardLayoutManagerVC.swift
//  CineFlow
//
//  Created by Eduardo on 13/09/24.
//

import UIKit

class KeyboardLayoutManagerVC: UIViewController {

    // Função que ajusta a constraint com base no frame do teclado
       func adjustLayoutForKeyboard(view: UIView, movingBottomConstraint: NSLayoutConstraint, keyboardFrameEnd: CGRect) {
           // Obter os insets da Safe Area
           var bottomOffset = view.safeAreaInsets.bottom
           
           // Obter a interseção do teclado com a view
           let viewIntersection = view.bounds.intersection(keyboardFrameEnd)
           
           // Se houver interseção, ajustar o offset
           if !viewIntersection.isEmpty {
               bottomOffset = view.bounds.maxY - viewIntersection.minY
           }
           
           // Ajustar a constraint com o novo offset
           movingBottomConstraint.constant = bottomOffset
           
           // Animar o layout se necessário
           UIView.animate(withDuration: 0.3) {
               view.layoutIfNeeded()
           }
       }
   }
