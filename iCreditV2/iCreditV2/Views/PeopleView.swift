//
//  PeopleView.swift
//  iCreditV2
//
//  Created by Артур Карачев on 27.12.24..
//

import SwiftUI

struct PeopleView: View {
    
    @Namespace private var animation
    
    private var people: [Person] = mockPeople
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            NavigationStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders] , content: {
                        Section {
                            LazyVGrid(columns: columns, content: {
                                ForEach(people) { person in
//                                    Text(person.name)
                                    NavigationLink {
//                                        NewExpenseView(editTransaction: transaction)
                                    } label: {
                                        PersonCardView(name: person.name, totalAmount: 10)
//                                        TransactionCardView(transaction: transaction)
                                    }
                                    .buttonStyle(.plain)
                                }
                            })
                        } header: {
                            HeaderView(size)
                        }
                    })
                    .padding(15)
                }
                .background(.gray.opacity(0.15))
            }
        }
    }
    
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5, content: {
                Text("Welcome!")
                    .font(.title.bold())
            })
            .visualEffect { content, geometryProxy in
                content
                    .scaleEffect(headerScale(size, proxy: geometryProxy), anchor: .topLeading)
            }
            
            Spacer(minLength: 0)
            
            NavigationLink {
                //                NewExpenseView()
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(appTint.gradient, in: .circle)
                    .contentShape(.circle)
            }
        }
        
        .padding(.bottom, 10)
        .background {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                Divider()
            }
            .visualEffect { content, geometryProxy in
                content
                    .opacity(headerBGOpacity(geometryProxy))
            }
            .padding(.horizontal, -15)
            .padding(.top, -(safeArea.top + 15))
        }
    }
    
    func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top
        print(minY)
        return minY > 0 ? 0 : (-minY / 15)
    }
    
    func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = min(max(progress, 0), 1) * 0.4
        return 1 + scale
    }
}

#Preview {
    ContentView()
}
