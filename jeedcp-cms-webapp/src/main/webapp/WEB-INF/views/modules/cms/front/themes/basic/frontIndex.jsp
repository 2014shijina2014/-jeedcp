<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
    <meta name="description" content="JeeSite ${site.description}"/>
    <meta name="keywords" content="JeeSite ${site.keywords}"/>
</head>
<body>

<div class="homepage-slider">
    <div id="sequence">
        <ul class="sequence-canvas">
            <!-- Slide 1 -->
            <li class="bg4">
                <!-- Slide Title -->
                <h2 class="title">Responsive</h2>
                <!-- Slide Text -->
                <h3 class="subtitle">It looks great on desktops, laptops, tablets and smartphones</h3>
                <!-- Slide Image -->
                <img class="slide-img" src="${ctxStatic}/mPurpose/img/homepage-slider/slide1.png" alt="Slide 1"/>
            </li>
            <!-- End Slide 1 -->
            <!-- Slide 2 -->
            <li class="bg3">
                <!-- Slide Title -->
                <h2 class="title">Color Schemes</h2>
                <!-- Slide Text -->
                <h3 class="subtitle">Comes with 5 color schemes and it's easy to make your own!</h3>
                <!-- Slide Image -->
                <img class="slide-img" src="${ctxStatic}/mPurpose/img/homepage-slider/slide2.png" alt="Slide 2"/>
            </li>
            <!-- End Slide 2 -->
            <!-- Slide 3 -->
            <li class="bg1">
                <!-- Slide Title -->
                <h2 class="title">Feature Rich</h2>
                <!-- Slide Text -->
                <h3 class="subtitle">Huge amount of components and over 30 sample pages!</h3>
                <!-- Slide Image -->
                <img class="slide-img" src="${ctxStatic}/mPurpose/img/homepage-slider/slide3.png" alt="Slide 3"/>
            </li>
            <!-- End Slide 3 -->
        </ul>
        <div class="sequence-pagination-wrapper">
            <ul class="sequence-pagination">
                <li>1</li>
                <li>2</li>
                <li>3</li>
            </ul>
        </div>
    </div>
</div>

<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="service-wrapper">
                    <img src="${ctxStatic}/mPurpose/img/service-icon/diamond.png" alt="Service 1">
                    <h3>Aliquam in adipiscing</h3>
                    <p>Praesent rhoncus mauris ac sollicitudin vehicula. Nam fringilla turpis turpis, at posuere turpis
                        aliquet sit amet condimentum</p>
                    <a href="#" class="btn">Read more</a>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="service-wrapper">
                    <img src="${ctxStatic}/mPurpose/img/service-icon/ruler.png" alt="Service 2">
                    <h3>Curabitur mollis</h3>
                    <p>Suspendisse eget libero mi. Fusce ligula orci, vulputate nec elit ultrices, ornare faucibus orci.
                        Aenean lectus sapien, vehicula</p>
                    <a href="#" class="btn">Read more</a>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="service-wrapper">
                    <img src="${ctxStatic}/mPurpose/img/service-icon/box.png" alt="Service 3">
                    <h3>Vivamus mattis</h3>
                    <p>Phasellus posuere et nisl ac commodo. Nulla facilisi. Sed tincidunt bibendum cursus. Aenean
                        vulputate aliquam risus rutrum scelerisque</p>
                    <a href="#" class="btn">Read more</a>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="section">
    <div class="container">
        <h2>Testimonials</h2>
        <div class="row">
            <!-- Testimonial -->
            <div class="testimonial col-md-4 col-sm-6">
                <!-- Author Photo -->
                <div class="author-photo">
                    <img src="${ctxStatic}/mPurpose/img/user1.jpg" alt="Author 1">
                </div>
                <div class="testimonial-bubble">
                    <blockquote>
                        <!-- Quote -->
                        <p class="quote">
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                            ut."
                        </p>
                        <!-- Author Info -->
                        <cite class="author-info">
                            - Name Surname,<br>Managing Director at <a href="#">Some Company</a>
                        </cite>
                    </blockquote>
                    <div class="sprite arrow-speech-bubble"></div>
                </div>
            </div>
            <!-- End Testimonial -->
            <div class="testimonial col-md-4 col-sm-6">
                <div class="author-photo">
                    <img src="${ctxStatic}/mPurpose/img/user5.jpg" alt="Author 2">
                </div>
                <div class="testimonial-bubble">
                    <blockquote>
                        <p class="quote">
                            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                            commodo."
                        </p>
                        <cite class="author-info">
                            - Name Surname,<br>Managing Director at <a href="#">Some Company</a>
                        </cite>
                    </blockquote>
                    <div class="sprite arrow-speech-bubble"></div>
                </div>
            </div>
            <div class="testimonial col-md-4 col-sm-6">
                <div class="author-photo">
                    <img src="${ctxStatic}/mPurpose/img/user2.jpg" alt="Author 3">
                </div>
                <div class="testimonial-bubble">
                    <blockquote>
                        <p class="quote">
                            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                            nulla pariatur."
                        </p>
                        <cite class="author-info">
                            - Name Surname,<br>Managing Director at <a href="#">Some Company</a>
                        </cite>
                    </blockquote>
                    <div class="sprite arrow-speech-bubble"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <h2>Our Clients</h2>
        <div class="clients-logo-wrapper text-center row">
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/canon.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/cisco.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/dell.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/ea.png" alt="Client Name"></a>
            </div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/ebay.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/facebook.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/google.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/hp.png" alt="Client Name"></a>
            </div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/microsoft.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/mysql.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/sony.png"
                    alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img
                    src="${ctxStatic}/mPurpose/img/logos/yahoo.png"
                    alt="Client Name"></a></div>
        </div>
    </div>
</div>


</body>
</html>