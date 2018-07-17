<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> - $SiteConfig.Title</title>
    <base href="/">

    <!-- Bootstrap -->
    <link href="/$themeDir/assets/css/bootstrap.min.css?v=3.3.7" rel="stylesheet">
    <link href="/$themeDir/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="/$themeDir/assets/css/font-awesome.min.css?v=4.7.0" rel="stylesheet">
    <link href="/$themeDir/assets/css/animate.css" rel="stylesheet">
    <link href="/$themeDir/assets/css/select2.min.css" rel="stylesheet">
    <link href="/$themeDir/assets/css/magnific-popup.css" rel="stylesheet">
    <link href="/$themeDir/assets/css/owl.carousel.min.css" rel="stylesheet">
    <link href="/$themeDir/assets/css/owl.theme.default.min.css" rel="stylesheet">
    <link href="/$themeDir/assets/fonts/sailec/stylesheet.css" rel="stylesheet">

    <link href="/$themeDir/assets/css/style.css" rel="stylesheet">


    <!--[if lt IE 9]>
    <script src="/$themeDir/assets/js/html5shiv.min.js"></script>
    <script src="/$themeDir/assets/js/respond.min.js"></script>
    <![endif]-->

</head>
<body class="<% with $Level(1) %>section--$URLSegment<% end_with %><% if $Level(2) %> page--<% with $Level(2) %>$URLSegment<% end_with %><% else %> page--$URLSegment<% end_if %>">
<header id="header" class="<% if $URLSegment == 'home' %>header-1<% end_if %>">
    <div class="top-bar">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-right top-bar-content">
                    <div class="top-bar-social social-menu">
                        <a href="https://www.facebook.com/GiftedFamiliesSupportGroupInc/"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/gfsginc"><i class="fa fa-twitter"></i></a>
                        <!--<a href="#"><i class="fa fa-linkedin"></i></a>-->
                    </div>
                    <div class="top-bar-tagline hidden-xs">
                        <div>
                            Gifted Families Support Group Inc.
                        </div>
                    </div>
                    <div class="top-bar-menu">
                        <div class="top-bar-menu-head">
                            <button>Location <i class="fa fa-caret-down"></i></button>
                        </div>
                        <div class="top-bar-menu-content">
                            <a href="/about/sub-branches/" class="current">NSW</a>
                            <a href="/about/sub-branches/south-coast">South Coast</a>
                            <a href="/about/sub-branches/illawarra">Illawarra</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="main-nav">
        <div class="container">
            <!--Desktop menu-->
            <div class="desktop hidden-xs">
                <div class="row">
                    <div class="col-sm-2">
                        <a href="/"><img src="/$themeDir/assets/img/logo.png" srcset="/$themeDir/assets/img/logo@2x.png 2x" width="143" height="143"></a>
                    </div>
                    <div class="col-sm-10">
                        <div class="desktop-top-menu text-right">
                            <% if CurrentMember %>
                                <a href="/Security/logout" class="top-button login">Logout</a>
                            <% else %> 
                                <a href="/register/" class="top-button register">Register</a>
                                <a href="/Security/login" class="top-button login">Login</a>
                            <% end_if %>
                        </div>
                        <div class="desktop-bottom-menu">
                            <ul>
                                <% loop $Menu(1) %>
                                    <% if $MenuTitle != "Home" %>
                                    <%--<% if $MenuTitle == "Members Only" && CurrentMember %>--%>
                                        <li class="<% if $Children %>has-sub-menu<% end_if %>">
                                            <a href="$Link">$MenuTitle</a>
                                            <% if $Children %>
                                                <ul class="sub-menu">
                                                    <% loop $Children %>
                                                        <li class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
                                                            <a href="$Link">$MenuTitle</a>
                                                        </li>
                                                    <% end_loop %>
                                                </ul>
                                            <% end_if %>
                                        </li>
                                     <%--<% end_if %>--%>
                                    <% end_if %>
                                <% end_loop %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!--Mobile menu-->
            <div class="mobile-nav hidden-sm hidden-md hidden-lg">
                <div class="row">
                    <div class="col-xs-6">
                        <a href="/"><img src="/$themeDir/assets/img/logo.png" srcset="/$themeDir/assets/img/logo@2x.png 2x" class="logo-mobile" width="143" height="143"></a>
                    </div>
                    <div class="col-xs-6 text-right">
                        <button type="button" class="mobile-toggle"><i class="fa fa-bars"></i></button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 no-padding relative-pos">
                        <div class="mobile-bottom-menu">
                            <ul>
                                <li class="has-sub-menu current">
                                    <a href="#">About</a>
                                    <ul class="sub-menu">
                                        <li class="current"><a href="#">About us</a></li>
                                        <li><a href="#">Committee</a></li>
                                        <li><a href="#">Sub Branches</a></li>
                                        <li><a href="#">Associations/Sponsors</a></li>
                                        <li><a href="#">FAQs</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Kids</a></li>
                                <li><a href="#">Parents</a></li>
                                <li><a href="#">Professionals</a></li>
                                <li><a href="#">Events</a></li>
                                <li><a href="#">Shop</a></li>
                                <li><a href="#">Press/News</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Register</a></li>
                                <li><a href="#">Login</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div class="desktop-fixed-nav hidden-xs">
        <nav class="main-nav">
            <div class="container">
                <div class="desktop hidden-xs">
                    <div class="row">
                        <div class="col-sm-2">
                            <a href="/"><img src="/$themeDir/assets/img/logo-sticky.png" srcset="/$themeDir/assets/img/logo-sticky@2x.png 2x" width="56" height="55"></a>
                        </div>
                        <div class="col-sm-10">
                            <div class="desktop-bottom-menu">
                                <ul>
                                    <% loop $Menu(1) %>
                                        <% if not $MenuTitle == "Home" %>
                                            <li class="<% if $Children %>has-sub-menu<% end_if %>">
                                                <a href="$Link">$MenuTitle</a>
                                                <% if $Children %>
                                                    <ul class="sub-menu">
                                                        <% loop $Children %>
                                                            <li class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
                                                                <a href="$Link">$MenuTitle</a>
                                                            </li>
                                                        <% end_loop %>
                                                    </ul>
                                                <% end_if %>
                                            </li>
                                        <% end_if %>
                                    <% end_loop %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </nav>
    </div>
    <div class="mobile-fixed-nav hidden-sm hidden-md hidden-lg">
        <div class="mobile-nav hidden-sm hidden-md hidden-lg">
            <div class="row">
                <div class="col-xs-6">
                    <a href="/"><img src="/$themeDir/assets/img/logo-sticky.png" srcset="/$themeDir/assets/img/logo-sticky@2x.png 2x" width="56" height="55"></a>
                </div>
                <div class="col-xs-6 text-right">
                    <button type="button" class="mobile-toggle"><i class="fa fa-bars"></i></button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="mobile-bottom-menu">
                        <ul>
                            <li class="has-sub-menu current">
                                <a href="#">About</a>
                                <ul class="sub-menu">
                                    <li class="current"><a href="#">About us</a></li>
                                    <li><a href="#">Committee</a></li>
                                    <li><a href="#">Sub Branches</a></li>
                                    <li><a href="#">Associations/Sponsors</a></li>
                                    <li><a href="#">FAQs</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Kids</a></li>
                            <li><a href="#">Parents</a></li>
                            <li><a href="#">Professionals</a></li>
                            <li><a href="#">Events</a></li>
                            <li><a href="#">Shop</a></li>
                            <li><a href="#">Press/News</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Register</a></li>
                            <li><a href="#">Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<% if $URLSegment == 'home' %>
<div class="banner-slider owl-carousel owl-theme">
    <div class="item bg-cover text-center vertical-center" style="background-image: url('/$themeDir/assets/img/slider-img.jpg')">
        <div class="banner-slider-content vertical-center-inner">
            <h2>
                <span>Fun events for kids,</span>
                <br><span>parents and teachers</span>
            </h2>
            <a href="#">upcoming events 2018 <i class="fa fa-long-arrow-right"></i></a>
        </div>
    </div>
    <div class="item bg-cover text-center vertical-center" style="background-image: url('/$themeDir/assets/img/slider-img.jpg')">
        <div class="banner-slider-content vertical-center-inner">
            <h2>
                <span>Fun events for kids,</span>
                <br><span>parents and teachers</span>
            </h2>
            <a href="#">upcoming events 2018 <i class="fa fa-long-arrow-right"></i></a>
        </div>
    </div>
    <div class="item bg-cover text-center vertical-center" style="background-image: url('/$themeDir/assets/img/slider-img.jpg')">
        <div class="banner-slider-content vertical-center-inner">
            <h2>
                <span>Fun events for kids,</span>
                <br><span>parents and teachers</span>
            </h2>
            <a href="#">upcoming events 2018 <i class="fa fa-long-arrow-right"></i></a>
        </div>
    </div>
</div>

<section id="homepage-main" class="homepage-main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="focus-box focus-box-1" data-mh="focus-box">
                            <div class="focus-box-thumb bg-cover" style="background-image: url('/$themeDir/assets/img/thumb-1.jpg')"></div>
                            <div class="focus-box-title">For Children</div>
                            <div class="focus-box-content">
                                Fun and games Connect with other kids Get involved & contribute Cool links
                                <br>and ... <a href="/kids/">more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="focus-box focus-box-2" data-mh="focus-box">
                            <div class="focus-box-thumb bg-cover" style="background-image: url('/$themeDir/assets/img/thumb-2.jpg')"></div>
                            <div class="focus-box-title">Parents and Families</div>
                            <div class="focus-box-content">
                                Safe, friendly support networks Stories Get-togethers Community resources
                                <br>and ... <a href="/parents/">more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="focus-box focus-box-3" data-mh="focus-box">
                            <div class="focus-box-thumb bg-cover" style="background-image: url('/$themeDir/assets/img/thumb-3.jpg')"></div>
                            <div class="focus-box-title">For Teachers</div>
                            <div class="focus-box-content">
                                Professional development Collaboration, Presentations Resources
                                <br>and ... <a href="/professionals/">more</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="homepage-welcome">
                    <h1>Welcome to <span>GFSG Inc</span></h1>
                    <div class="row">
                        <div class="col-sm-4 col-md-3">
                            <img src="/$themeDir/assets/img/melinda.png" srcset="/$themeDir/assets/img/melinda@2x.png 2x" class="img-responsive margin-bottom-15">
                            <p>
                                <em>
                                    Melinda Gindy
                                    <br>President, GFSG Inc.
                                </em>
                            </p>
                        </div>
                        <div class="col-sm-8 col-md-9">
                            <div class="homepage-welcome-content">
                                <p>
                                    Gifted Families Support Group (GFSG Inc) is a not for profit association with the vision to support gifted children, their families, and their educators.
                                </p>
                                <p>
                                    We provide opportunity to openly discuss their own experiences without judgement, and to promote access for educators to quality professional development regarding the education of both gifted and GLD children.
                                </p>
                                <img src="/$themeDir/assets/img/signature.png" srcset="/$themeDir/assets/img/signature@2x.png 2x" class="img-responsive">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-3">
                <div class="events-widget">
                    <h2>Upcoming Events <span>2018</span></h2>
                    <div class="event-item">
                        <div class="dates clearfix">
                            <i class="fa fa-calendar"></i>
                            <div>
                                <a href="#" class="month">march</a>
                                <a href="#" class="date">18</a>
                            </div>
                        </div>
                        <div class="times clearfix">
                            <i class="fa fa-clock-o"></i>
                            <span>7:30pm, Tuesday</span>
                        </div>
                        <h3>Games for enquiring minds</h3>
                        <p>
                            <em>For: gifted children (yrs k-7) and their caregivers</em>
                        </p>
                        <p>
                            A night of fun including board games and creative challenges.
                        </p>
                        <a href="#" class="event-button event-button-1">more info</a>
                        <a href="#" class="event-button event-button-2">YES, I’m interested</a>
                    </div>

                    <div class="event-item">
                        <div class="dates clearfix">
                            <i class="fa fa-calendar"></i>
                            <div>
                                <a href="#" class="month">march</a>
                                <a href="#" class="date">18</a>
                            </div>
                        </div>
                        <div class="times clearfix">
                            <i class="fa fa-clock-o"></i>
                            <span>7:30pm, Tuesday</span>
                        </div>
                        <h3>Games for enquiring minds</h3>
                        <p>
                            <em>For: gifted children (yrs k-7) and their caregivers</em>
                        </p>
                        <p>
                            A night of fun including board games and creative challenges.
                        </p>
                        <a href="#" class="event-button event-button-1">more info</a>
                        <a href="#" class="event-button event-button-2">YES, I’m interested</a>
                    </div>

                    <div class="event-item view-all">
                        <a href="/events/">view all events <i class="fa fa-long-arrow-right"></i></a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

<section id="social" class="social">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 margin-bottom-30">
                <div class="social-box">
                    <div class="social-box-header facebook clearfix">
                        <span>Latest Facebook</span>
                        <i class="fa fa-facebook"></i>
                    </div>
                    <div class="social-box-embed">
                        <div id="fb-root"></div>
                        <script>(function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12&appId=1588760871231255&autoLogAppEvents=1';
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>
                        <div class="fb-post" data-href="https://www.facebook.com/20531316728/posts/10154009990506729/" data-show-text="true"><blockquote cite="https://www.facebook.com/20531316728/posts/10154009990506729/" class="fb-xfbml-parse-ignore">Posted by <a href="https://www.facebook.com/facebook/">Facebook</a> on&nbsp;<a href="https://www.facebook.com/20531316728/posts/10154009990506729/">Thursday, August 27, 2015</a></blockquote></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 margin-bottom-30">
                <div class="social-box">
                    <div class="social-box-header twitter clearfix">
                        <span>Latest Tweet</span>
                        <i class="fa fa-twitter"></i>
                    </div>
                    <div class="social-box-embed twitter">
                        <blockquote class="twitter-tweet" width="580px" data-lang="en"><p lang="en" dir="ltr">Sunsets don&#39;t get much better than this one over <a href="https://twitter.com/GrandTetonNPS?ref_src=twsrc%5Etfw">@GrandTetonNPS</a>. <a href="https://twitter.com/hashtag/nature?src=hash&amp;ref_src=twsrc%5Etfw">#nature</a> <a href="https://twitter.com/hashtag/sunset?src=hash&amp;ref_src=twsrc%5Etfw">#sunset</a> <a href="http://t.co/YuKy2rcjyU">pic.twitter.com/YuKy2rcjyU</a></p>&mdash; US Department of the Interior (@Interior) <a href="https://twitter.com/Interior/status/463440424141459456?ref_src=twsrc%5Etfw">May 5, 2014</a></blockquote>
                        <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="newsletter">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h2>Subscribe to Thought Space E-Newsletter</h2>
                <p>
                    Keep up to date with all the latest in the world of Gifted Families.
                </p>
            </div>
        </div>
        <div class="row">
            <form>
                <div class="col-sm-3">
                    <div class="input-wrapper">
                        <input class="form-control" placeholder="Your Name">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="input-wrapper">
                        <input class="form-control" placeholder="Your surname">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="input-wrapper">
                        <input type="email" class="form-control" placeholder="Your Email">
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="button-wrapper">
                        <button class="button">Subscribe <i class="fa fa-long-arrow-right"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<section class="partners">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h2>Proudly working and collaborating with</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4">
                <div class="partner-box">
                    <img src="/$themeDir/assets/img/partner-1.png" srcset="/$themeDir/assets/img/partner-1.png 2x" class="img-responsive center-block">
                    <span>AAEGT</span>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="partner-box">
                    <img src="/$themeDir/assets/img/partner-2.png" srcset="/$themeDir/assets/img/partner-2.png 2x" class="img-responsive center-block">
                    <span>GLD Australia</span>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="partner-box">
                    <img src="/$themeDir/assets/img/partner-3.png" srcset="/$themeDir/assets/img/partner-3.png 2x" class="img-responsive center-block">
                    <span>The Teachers Guild of NSW</span>
                </div>
            </div>
        </div>
    </div>
</section>
<% else %>

<div class="page-banner bg-cover"></div>
<section id="page-main" class="page-main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <article class="article">
<!--<nav class="primary">
    <span class="nav-open-button">²</span>
    <ul>
        <% loop $Menu(1) %>
            <li class="$LinkingMode"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
        <% end_loop %>
        <% if CurrentMember %> 
            <li class="$LinkingMode"><a href="/Security/logout">Logout</a></li>
        <% else %> 
            <li class="$LinkingMode"><a href="/Security/login">Login</a></li>
        <% end_if %>
    </ul>
</nav>-->
                    <h1>$Title</h1>
                    $Content
                    $Form
                    $CommentsForm

<!--<ul>
    <% loop $Menu(1) %>
        <li>
            <a href="$Link" title="Go to the $Title page" class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
                $MenuTitle
            </a>
           
                <% if $Children %>
                    <ul class="secondary">
                        <% loop $Children %>
                            <li class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>"><a href="$Link">$MenuTitle</a></li>
                        <% end_loop %>
                    </ul>
                <% end_if %>
            
        </li>
    <% end_loop %>
</ul>-->

                </article>
            </div>
            <div class="col-md-3">
                <!-- BING -->
                <% include SideBar %>
                <!-- BANG -->
            </div>
        </div>
    </div>
</section>
<% end_if %>

<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <h2>Main Navigation</h2>
                    <ul class="footer-links">

                        <% loop $Menu(1) %>
                            <li class="$LinkingMode"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
                        <% end_loop %>

                    </ul>
                </div>
                <div class="col-sm-3">
                    <h2>Links</h2>
                    <ul class="footer-links">
                        <li><a href="#">Link A</a></li>
                        <li><a href="#">Link B</a></li>
                        <li><a href="#">Link C</a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <h2>Contact</h2>
                    <ul class="footer-links">
                        <li><a href="/about/committee/">Committee</a></li>
                        <li><a href="/about/sub-branches/south-coast">South Coast</a></li>
                        <li><a href="/about/sub-branches/illawarra">Illawarra</a></li>
                    </ul>
                    <ul class="footer-links">
                        <li><a href="/privacy-policy">Privacy Policy</a></li>
                        <li><a href="/register/">Register</a></li>
                        <li><a href="/Security/login">Login</a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <h2>
                        Gifted Families
                        <br>Support Group Inc
                    </h2>
                    <address>
                        PO Box 604
                        <br>Moorebank NSW 1875
                    </address>
                    <div class="footer-social social-menu">
                        <a href="https://www.facebook.com/GiftedFamiliesSupportGroupInc/"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/gfsginc"><i class="fa fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <div class="copyright">© Copyright 2018 GFSG Inc. ASSN # 999 999 999 | Website Design by <a href="http://www.cyrius.com.au/">Cyrius</a></div>
                </div>
            </div>
        </div>
    </div>
</footer>

<div class="back-to-top"><i class="fa fa-angle-up fa-3x"></i></div>
<!--[if lt IE 9]>
    <script type="text/javascript" src="/$themeDir/assets/js/jquery-1.11.2.min.js?ver=1.11.2"></script>
<![endif]-->
<!--[if (gte IE 9) | (!IE)]><!-->
    <script type="text/javascript" src="/$themeDir/assets/js/jquery-2.1.3.min.js?ver=2.1.3"></script>
<!--<![endif]-->
<script src="/$themeDir/assets/js/ie10-viewport-bug-workaround.js"></script>
<script src="/$themeDir/assets/js/bootstrap.min.js?v=v3.3.7"></script>
<script src="/$themeDir/assets/js/jquery.singlePageNav.min.js"></script>
<script src="/$themeDir/assets/js/jquery.appear.js"></script>
<script src="/$themeDir/assets/js/icheck.min.js"></script>
<script src="/$themeDir/assets/js/jquery.magnific-popup.min.js"></script>
<script src="/$themeDir/assets/js/owl.carousel.min.js"></script>
<script src="/$themeDir/assets/js/jquery.matchHeight.js"></script>
<script src="/$themeDir/assets/js/select2.full.min.js?v=4.0.6"></script>

<script src="/$themeDir/assets/js/scripts.js"></script>
</body>
</html>