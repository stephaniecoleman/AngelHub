var dp = jQuery;
//dp.noConflict();
dp(document).ready(function() {
    //EXPANDING THUMBNAIL
    Grid.init();
    // Superslides fullscreen slider
    //delete

    //BACK TO TOP
    dp("#backtotop").backToTop();
    //PARALLAX
    dp('.bg-about').parallax("10%", 1);
    dp('.bg-skill').parallax("10%", 1);
    //VIDEO BACKGROUND
    var videobackground = new dp.backgroundVideo(dp('.bg-video'), {
        "align": "centerXY",
        "muted": "muted", // change value "muted" or "no"
        "width": 1280,
        "height": 720,
        "path": "video/",
        "filename": "steven",
        "types": ["mp4", "ogg", "webm"]
    });
    //TOOLTIP
    dp('a[data-toggle="tooltip"]').tooltip();
    //VIDEO INDEX
    var videobackground = new dp.backgroundVideo(dp('.home-video'), {
        "align": "centerXY",
        "muted": "muted", // change value "muted" or "no"
        "width": 1280,
        "height": 720,
        "path": "video/",
        "filename": "cloud",
        "types": ["mp4", "ogg", "webm"]
    });
    //NIVO LIGHTBOX
    //deleted

    //TESTIMONIAL SLIDER
    //deleted

    //ANIMATED OBJECT
    dp(".animatez").waypoint(function(direction) {
        var effect = dp(this).attr('data-effect');
        dp(this).removeClass('animatez');
        dp(this).addClass('animated ' + effect);
    }, {
        offset: '70%'
    });
    //ANIMATED SKILL BAR
    dp(".bar").waypoint(function(direction) {
        var value = dp(this).attr('data-value');
        dp(this).css({
            'width': value + '%'
        });
    }, {
        offset: '80%'
    });

    //COUNT UP ON SCREEN
    // dp('.countTo').waypoint(function(direction) {
    //     dp('.countTo').countTo();
    //     dp('.countTo').removeClass('countTo');
    //     dp(this).removeClass('timer');
    // }, {
    //     offset: "80%"
    // });

    //SMOOTH SCROLL
    //deleted

    //FITVIDS
    dp(".responsive-video").fitVids();

    //BACKSTRETCH
    if(dp.fn.backstretch){
        var bg_image = dp(".home-image");
        var bg_image_src = bg_image.data("src");
        bg_image.backstretch(bg_image_src);
    }
    //COUNT DOWN COMING SOON
    // if (dp.fn.countdown) {
    //     var endDate = "December 31, 2014  15:03:25"; // <-- Change to your date launch.
    //     dp('.countdown.styled').countdown({
    //         date: endDate,
    //         render: function(data) {
    //             dp(this.el).html("<div>" + this.leadingZeros(data.days, 3) + " <span>days</span></div><div>" + this.leadingZeros(data.hours, 2) + " <span>hrs</span></div><div>" + this.leadingZeros(data.min, 2) + " <span>min</span></div><div>" + this.leadingZeros(data.sec, 2) + " <span>sec</span></div>");
    //         }
    //     });
    // }

    //HTML 5 Audio Player
    if (dp.fn.mediaelementplayer) {
        dp('audio , video').mediaelementplayer({
            loop: false,
            enableAutosize: false,
            features: ['playpause', 'progress', 'current', 'volume'],
            audioHeight: 40,
            alwaysShowHours: false

        });
    }

});
/*var container = document.querySelector('#portfoliomasonry');
var msnry = new Masonry(container, {
    itemSelector: '.portfolio-item',
    columnWidth: '.portfolio-item',
}); */
