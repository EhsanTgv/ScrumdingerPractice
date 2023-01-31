//
//  DetailEditView.swift
//  ScrumdingerPractice
//
//  Created by Ehsan Taghavi on 31.01.2023.
//

import SwiftUI

struct DetailEditView: View {
    @State private var data = DailyScrum.Data()
    @State private var newAttendeeName = ""

    var body: some View {
        Form{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lenghInMinutes, in: 5...30, step: 1){
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lenghInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lenghInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in data.attendees.remove(atOffsets:indices)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action:{
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name:newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
