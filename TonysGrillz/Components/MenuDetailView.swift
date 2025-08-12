//
//  MenuDetailView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftUI

struct MenuDetailView: View {
    @Environment(\.dismiss) var dismiss
    let cartViewModel: CartViewModel
    let item: MenuItems
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
                        
                        // FIXME: Bug where when you decrease to 0 everything in here dissapears, also plsu minus buttons dulipcate hwne swiicthing from one itme to another
                        ForEach(cartViewModel.cartItem) { cartItem in
                                HStack {
                                    Button {
                                        cartViewModel.decreaseQuantity(item: item)
                                    } label: {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.title2)
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    Text("\(cartItem.quantity)")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    Button {
                                        cartViewModel.addToCart(item: item)
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.title2)
                                            .foregroundColor(.green)
                                            .padding()
                                }
                            }
                                .padding()
                        }
                        
                    }
                    
                    NavigationLink {
                        CartView(cartViewModel: cartViewModel)
                    } label: {
                        HStack {
                            Text("Add to order")
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
            }
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
    MenuDetailView(cartViewModel: CartViewModel(), item: MenuItems(id: UUID(), name: "", price: 12.99, details: "", isAvailable: true, image: "burger")
    )
}

