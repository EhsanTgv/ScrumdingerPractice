import SwiftUI

struct ScrumView: View{
    let scrum: [DailyScrum]
    
    var body: some View{
        List{
            ForEach(scrum,id: \.title ) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
            }
        }
    }
}


struct ScrumView_Previews:PreviewProvider{
    static var previews: some View{
        ScrumView(scrum: DailyScrum.sampleData)
    }
}
