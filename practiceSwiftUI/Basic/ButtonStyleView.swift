//
//  ButtonStyleView.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/13/23.
//

import SwiftUI

struct ButtonStyleView: View {
    var body: some View {
        Spacer()
        HStack {
            VStack {
                HStack {
                    Button(action: {
                        print("AC")
                    }, label: {
                        Text("AC")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.gray))
                    Button(action: {
                        print("+/-")
                    }, label: {
                        Text("+/-")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.gray))
                    Button(action: {
                        print("%")
                    }, label: {
                        Text("%")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.gray))
                }
                HStack {
                    Button(action: {
                        print("7")
                    }, label: {
                        Text("7")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                    Button(action: {
                        print("8")
                    }, label: {
                        Text("8")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                    Button(action: {
                        print("9")
                    }, label: {
                        Text("9")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                }
                HStack {
                    Button(action: {
                        print("4")
                    }, label: {
                        Text("4")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                    Button(action: {
                        print("5")
                    }, label: {
                        Text("5")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                    Button(action: {
                        print("6")
                    }, label: {
                        Text("6")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                }
                HStack {
                    Button(action: {
                        print("1")
                    }, label: {
                        Text("1")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                    Button(action: {
                        print("2")
                    }, label: {
                        Text("2")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                    Button(action: {
                        print("3")
                    }, label: {
                        Text("3")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                }
                HStack {
                    Button(action: {
                        print("0")
                    }, label: {
                        Text("0")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                    Button(action: {
                        print(".")
                    }, label: {
                        Text(".")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.brown))
                    Button(action: {
                        print("<-")
                    }, label: {
                        Text("<-")
                            .frame(maxWidth: 50, maxHeight: 50)
                    }).buttonStyle(NumberButtonStyle(color: Color.yellow))
                }
                
            }//VStack
            VStack {
                Button(action: {
                    print("/")
                }, label: {
                    Text("/")
                        .frame(maxWidth: 50, maxHeight: 50)
                }).buttonStyle(NumberButtonStyle(color: Color.yellow))
                Button(action: {
                    print("*")
                }, label: {
                    Text("*")
                        .frame(maxWidth: 50, maxHeight: 50)
                }).buttonStyle(NumberButtonStyle(color: Color.yellow))
                Button(action: {
                    print("-")
                }, label: {
                    Text("-")
                        .frame(maxWidth: 50, maxHeight: 50)
                }).buttonStyle(NumberButtonStyle(color: Color.yellow))
                Button(action: {
                    print("+")
                }, label: {
                    Text("+")
                        .frame(maxWidth: 50, maxHeight: 50)
                }).buttonStyle(NumberButtonStyle(color: Color.yellow))
                Button(action: {
                    print("=")
                }, label: {
                    Text("=")
                        .frame(maxWidth: 50, maxHeight: 50)
                }).buttonStyle(NumberButtonStyle(color: Color.yellow))
            }
        }//HStack
        
        
        
    }
}

#Preview {
    ButtonStyleView()
}

struct NumberButtonStyle: ButtonStyle {
    var color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 35))
            .foregroundColor(Color.black)
            .padding()
            .background(color)
            .scaleEffect(configuration.isPressed ? 1.4 : 1.0)
            .clipShape(Circle())
    }
}
