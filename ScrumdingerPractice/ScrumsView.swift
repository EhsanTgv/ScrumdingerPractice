import SwiftUI

struct ScrumView: View{
    let scrum: [DailyScrum]
    
    var body: some View{
        List{
            ForEach(scrum,id: \.title ) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                        .listRowBackground(scrum.theme.mainColor)
                }
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar{
            Button(action: {}){
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
    }
}


struct ScrumView_Previews:PreviewProvider{
    static var previews: some View{
        NavigationView {
            ScrumView(scrum: DailyScrum.sampleData)
        }
    }
}
