import SwiftUI

struct NamesView: View {
    var body: some View {
        MyVStack{
            HStack{
                Image(systemName: "figure.basketball")
                Text("조형구")
            }
            .foregroundColor(.red)
            
            HStack{
                Image(systemName: "bicycle")
                    .padding(.horizontal, -10.0)
                Text("김예원")
            }
            .foregroundColor(.orange)
            
            HStack{
                Image(systemName: "music.quarternote.3")
                Text("박성민")
            }
            .foregroundColor(.yellow)
            
            HStack{
                Image(systemName: "scribble.variable")
                Text("박진형")
            }
            .foregroundColor(.green)
            
            HStack{
                Image(systemName: "heart.fill")
                Text("이석준")
            }
            .foregroundColor(.blue)
            
            HStack{
                Image(systemName: "swift")
                Text("이승준")
            }
            .foregroundColor(.indigo)
            
            HStack{
                Image(systemName: "sun.min.fill")
                Text("이원형")
            }
            .foregroundColor(.purple)
            
            HStack{
                Image(systemName: "airplane")
                Text("전혜성")
            }
            .foregroundColor(.mint)
        }
        
//        .modifier(StandardName())
        
    }
}
//ViewModifier 스타일 수정자를 한번에 모음
struct StandardName: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.largeTitle)
    }
    
}

//ViewBuilder 스택을 만듬
struct MyVStack<Content: View>:View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        VStack(spacing: 40) {
            content()
        }
        .modifier(StandardName())
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
    }
}