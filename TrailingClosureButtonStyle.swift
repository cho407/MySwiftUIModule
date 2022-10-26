//후행클로져 이용한 버튼 구성
           Button("Hello", action: {
                         print("전기차를 충전해주세요")
                     })



                     Button("Hello") {
                         print("안녕하세요")
                     }



                     Button(action: {
                         print("안녕하세요")
                     }, label: {
                         Image(systemName: "heart")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .padding()
                     })





                     Button(action: {
                         print("안녕하세요")
                     }) {
                         Image(systemName: "heart.fill")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .padding()
                     }