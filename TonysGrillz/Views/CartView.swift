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
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Order Details")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button {
                            cartViewModel.clearCart()
                        } label: {
                            // FIXME: Add an alert to this
                            Text("Remove All")
                                .font(.subheadline)
                            Image(systemName: "trash")
                        }
                        .foregroundStyle(.red)
                    }
                    .padding(.horizontal)
                    
                    if cartViewModel.cartItem.isEmpty {
                        Text("Your cart is empty.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ScrollView {
                            VStack {
                                ForEach(cartViewModel.cartItem) { cartItem in
                                    HStack {
                                        Text(cartItem.menuItems.name)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Button {
                                                cartViewModel.decreaseQuantity(item: cartItem.menuItems)
                                            } label: {
                                                Image(systemName: "minus.circle")
                                                    .font(.title3)
                                            }
                                            
                                            Text("\(cartItem.quantity)")
                                                .font(.headline)
                                            
                                            Button {
                                                cartViewModel.increaseQuantity(item: cartItem.menuItems)
                                            } label: {
                                                Image(systemName: "plus.circle")
                                                    .font(.title3)
                                            }
                                        }
                                    }
                                    .padding(.vertical, 8)
                                    .padding(.horizontal)
                                    .background(.green)
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                Divider()
                
                VStack {
                    // FIXME: Maybe add stepper here instead minus an plus button
                    HStack {
                        Text("Subtotal:")
                        Spacer()
                        Text(cartViewModel.subtotal, format: .currency(code: "USD"))
                    }
                    
                    HStack {
                        Text("Tax:")
                        Spacer()
                        Text(cartViewModel.tax, format: .currency(code: "USD"))
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Grand Total:")
                            .font(.headline)
                        Spacer()
                        Text(cartViewModel.grandTotal, format: .currency(code: "USD"))
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                }
                .padding()
                
                Spacer()
                
                Button {
                   
                } label: {
                    Text("Checkout Now")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(cartViewModel.cartItem.isEmpty ? Color.gray : Color.green)
                        .cornerRadius(15)
                }
                .padding()
                .disabled(cartViewModel.cartItem.isEmpty)
            }
            .navigationTitle("Cart")
        }
    }
}

#Preview {
    CartView(cartViewModel: CartViewModel())
}
