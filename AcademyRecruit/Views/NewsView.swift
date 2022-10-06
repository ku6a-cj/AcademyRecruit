//
//  NewsView.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 06/10/2022.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        WebView(url: URL(string: "https://www.wojsko-polskie.pl/wat/articles/list/aktualnosci-w/")!)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
