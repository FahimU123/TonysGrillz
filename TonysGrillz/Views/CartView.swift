//
//  CartView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI

struct CartView: View {
    @State private var cartViewModel = CartViewModel()
    var body: some View {
        VStack {
            ForEach(cartViewModel.cartItem) { cartItem in
                Text("\(cartItem.quantity)")
            }
        }

    }
}

#Preview {
    CartView()
}

// Next Steps:
// How to check value of quantity in debugger
// Data persistence for cart methods
// More documentation

