//
//  Post.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 12/8/22.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

class PostData {
    var posts = [
        Post(author: "ALLISON JOHNSON", description: "Pixel 7 phones are getting a VPN and call enhancements today", image: "Pixel_7", likes: 5, views: 100),
        Post(author: "JAY PETERS", description: "Apple Music is getting a karaoke mode", image: "karaoke", likes: 30, views: 500),
        Post(author: "UMAR SHAKIR", description: "HBO Max returns to Amazon’s Prime Video Channels", image: "acastro_STK055_06", likes: 27, views: 345),
        Post(author: "ANTONIO G. DI BENEDETTO", description: "Google’s Nest Hub smart display is $70 off with a free WiZ smart bulb", image: "dseifert_20210323_4485_0001", likes: 12, views: 94)
    ]
}
