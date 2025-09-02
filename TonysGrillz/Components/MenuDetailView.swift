//
//  MenuDetailView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftUI

struct MenuDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    /// Manages the cart state with its cartItem array
    var cartViewModel: CartViewModel
    
    /// Specific instance of MenuItems model
    let item: MenuItems
    
    let orderItemViewModel: OrderItemsViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.bottom)
                
                VStack {
                    Text(item.details)
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    // Checks the cartItem property in the cartViewModel and matches it to the one currently on this screen
                    if let cartItem = cartViewModel.cartItem.first(where: { $0.menuItems.id == item.id } ) {
                        Stepper(
                            onIncrement: {
                                cartViewModel.increaseQuantity(item: item)
                            },
                            onDecrement: {
                                cartViewModel.decreaseQuantity(item: item)
                            }
                        ) {
                            Text("Quantity: \(cartItem.quantity)")
                                .font(.title2)
                        }
                        .padding()
                    }
                }
                
                NavigationLink {
                    CartView(cartViewModel: cartViewModel)
                    
                } label: {
                    HStack {
                        Text("Add to Cart")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text(cartViewModel.subtotal, format: .currency(code: "USD"))
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                }
            }
            .padding()
            
            .navigationTitle(item.name)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
        .onAppear {
            cartViewModel.addToCart(item: item)
        }
    }
}


#Preview {
    MenuDetailView(cartViewModel: CartViewModel(), item: MenuItems(id: UUID(), name: "", price: 12.99, details: "", isAvailable: true, image: "burger"), orderItemViewModel: OrderItemsViewModel()
    )
}

