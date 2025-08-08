//
//  CartView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftData
import SwiftUI

struct CartView: View {
    let cartViewModel: CartViewModel
    @Query(sort: \Cart.quantity) var cartItems: [Cart]
    var body: some View {
        VStack {
            ForEach(cartViewModel.cartItem) { cartItem in
                Text("\(cartItem.quantity)")
            }
            ForEach(cartItems) { cart in
                Text("\(cart.quantity)")
            }
        }

    }
}

//#Preview {
//    CartView(cartViewModel: CartViewModel())
//}


