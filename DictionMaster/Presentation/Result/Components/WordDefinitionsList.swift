////
////  WordDefinitionsList.swift
////  DictionMaster
////
////  Created by Joan Wilson Oliveira on 05/02/24.
////
//
//import SwiftUI
//
//struct WordDefinitionsList: View {
//    let meanings: [Meaning]
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            ForEach(meanings.enumerated().map { $0.offset + 1 }, id: \.self) { index in
//                
//                let meaning = self.meanings[index - 1]
//                
//                ForEach((meaning.definitions?.enumerated().map { $0.offset + 1 })!, id: \.self) { defIndex in
//                    
//                    let definition = meaning.definitions![defIndex - 1]
//                    
//                    VStack(alignment: .leading) {
//                        Text(
//                            makeDeepBlueText(String(describing: index) + ") ") +
//                            makeSemiLightBlueGrayLabel(meaning.partOfSpeech!) 
////                            makeDeepBlueText(definition.definition)
//                        )
//                        .padding(.bottom, 5)
////                        
////                        Text("• \(definition.example)")
////                            .font(.system(.callout, design: .rounded, weight: .regular))
////                            .foregroundStyle(Color("color/deep_blue"))
////                            .padding(.bottom, 30)
//                    }
//                }
//            }
//        }
//    }
//    
//    private func makeSemiLightBlueGrayLabel(_ str: String) -> AttributedString {
//        var attrString = AttributedString("[\(str)] ")
//        attrString.font = .system(.callout, design: .rounded, weight: .bold)
//        attrString.foregroundColor = Color("color/semiLight_blue_gray")
//        return attrString
//    }
//    
//    private func makeDeepBlueText(_ str: String) -> AttributedString {
//        var attrString = AttributedString(str)
//        attrString.font = .system(.callout, design: .rounded, weight: .bold)
//        attrString.foregroundColor = Color("color/deep_blue")
//        return attrString
//    }
//}
//
//#Preview(traits: .sizeThatFitsLayout) {
//    WordDefinitionsList(meanings: [
//        Meaning(
//            partOfSpeech: "noun",
//            definitions: [
//                .init(
//                    definition: "used as a greeting or to begin a phone ",
//                    example: "hello there, Katie!"
//                )
//            ]
//        ),
//        Meaning(
//            partOfSpeech: "exclamation",
//            definitions: [
//                .init(
//                    definition: "dasd dsasd dad ",
//                    example: "hdasd dasd !"
//                ),
//                .init(
//                    definition: "dasd dsas2222 ",
//                    example: "hdasd dasd !"
//                ),
//                .init(
//                    definition: "dasd dsa3333d ",
//                    example: "hdasd dasd !"
//                ),
//                .init(
//                    definition: "dasd dsa444d ",
//                    example: "hdasd dasd !"
//                )
//            ]
//        )
//    ])
//}
