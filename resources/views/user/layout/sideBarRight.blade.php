<div class="col-md-4">
	<!-- ad widget-->
          <div class="aside-widget text-center">
            <a href="#" style="display: inline-block;margin: auto;">
              <img class="img-responsive" src="./img/ad-3.jpg" alt="">
            </a>
          </div>
          <!-- /ad widget -->

          <!-- social widget -->
          <div class="aside-widget">
            <div class="section-title">
              <h2 class="title">Social Media</h2>
            </div>
            <div class="social-widget">
              <ul>
                <li>
                  <a href="https://www.facebook.com/DoanHoiITUTE" target="_blank" class="social-facebook">
                    <i class="fa fa-facebook"></i>
                    <!-- <span>21.2K<br>Followers</span> -->
                  </a>
                </li>
               <!--  <li>
                  <a href="#" class="social-twitter">
                    <i class="fa fa-twitter"></i>
                    <span>10.2K<br>Followers</span>
                  </a>
                </li>
                <li>
                  <a href="#" class="social-google-plus">
                    <i class="fa fa-google-plus"></i>
                    <span>5K<br>Followers</span>
                  </a>
                </li> -->
              </ul>
            </div>
          </div>
          <!-- /social widget -->

          <!-- category widget -->
          <div class="aside-widget">
            <div class="section-title">
              <h2 class="title">Categories</h2>
            </div>
            <div class="category-widget">
              <ul>
                 @foreach ($newsType as $sy)
                  <li><a href="{{ route('get_new_by_ctg',['id'=>$sy->id]) }}">{{$sy->name}} <span>(12)</span></a></li>
                  @endforeach
              </ul>
            </div>
          </div>
          <!-- /category widget -->
          <!-- post widget -->
          <div class="aside-widget">
            <div class="section-title">
              <h2 class="title">Bài viết mới</h2>
            </div>
            
            <!-- post -->
            @foreach ($lastedNews as $list)
            <div class="post post-widget">
              <a class="post-img" href="{{ route('get_new',['id'=>$list->id]) }}">
                @if($list->image != "") 
                  <img src="{{asset('images/news')}}/{{$list->image}}" alt="">
                  @else 
                              <img src="{{asset('assets/img/image-not-available.png')}}" alt="Colorlib">
                   @endif
              </a>
              <div class="post-body">
                <div class="post-category">
                  <a href="{{ route('get_new_by_ctg',['id'=>$list->ofType->id]) }}">{{$list->ofType->name}}</a>
                </div>
                <h3 class="post-title"><a href="{{ route('get_new',['id'=>$list->id]) }}">{{$list->title}}</a></h3>
              </div>
            </div>
             @endforeach
            <!-- /post -->
          </div>
          <!-- /post widget -->

          <!-- newsletter widget -->
          <div class="aside-widget">
            <div class="section-title">
              <h2 class="title">Newsletter</h2>
            </div>
            <div class="newsletter-widget">
              <form>
                <p>Nec feugiat nisl pretium fusce id velit ut tortor pretium.</p>
                <input class="input" name="newsletter" placeholder="Enter Your Email">
                <button class="primary-button">Subscribe</button>
              </form>
            </div>
          </div>
          <!-- /newsletter widget -->

          <!-- Ad widget -->
          <div class="aside-widget text-center">
            <a href="#" style="display: inline-block;margin: auto;">
              <img class="img-responsive" src="./img/ad-1.jpg" alt="">
            </a>
          </div>
          <!-- /Ad widget -->
</div>