<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="container">
			<section class="product-detail">
				<div class="row">
					<div class="col-lg-6">
						<div class="row images-row">
							<div class="col-lg-2">
								<div class="swiper-product-thumbs">
									<div class="swiper-container">
										<div class="swiper-wrapper">
											<xsl:apply-templates select='/ProductDetail/ProductImages'
												mode='SmallThumbnail'>
											</xsl:apply-templates>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-10">
								<div class="product-detail-swiper">
									<div class="swiper-container swiper-product-top">
										<div class="swiper-wrapper">
											<xsl:apply-templates select='/ProductDetail/ProductImages'
												mode='BigThumbnail'>
											</xsl:apply-templates>
										</div>
										<div class="product-detail-button-next"></div>
										<div class="product-detail-button-prev"></div>
									</div>
									<h5>
										<xsl:value-of select="/ProductDetail/NoteText"></xsl:value-of>
									</h5>
								</div>
								<div class="product-add-cart">
									<h3> <span>
											<xsl:value-of select="/ProductDetail/ProductComparePrice"></xsl:value-of>:
										</span>
										<xsl:value-of select='/ProductDetail/Price'></xsl:value-of>
									</h3>
									<div class="add-cart-wrapper">
										<div class="unit"><span>
												<xsl:if test="floor(/ProductDetail/ShowOption div 4) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/PCText"></xsl:value-of>
												</xsl:if>

												<xsl:if test="floor(/ProductDetail/ShowOption div 8) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/RollText"></xsl:value-of>
												</xsl:if>
												<xsl:if test="floor(/ProductDetail/ShowOption div 16) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/SetText"></xsl:value-of>
												</xsl:if>
												<xsl:if test="floor(/ProductDetail/ShowOption div 32) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/BarText"></xsl:value-of>
												</xsl:if>
												<xsl:if test="floor(/ProductDetail/ShowOption div 64) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/PlateText"></xsl:value-of>
												</xsl:if>
												<xsl:if test="floor(/ProductDetail/ShowOption div 128) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/MeterText"></xsl:value-of>
												</xsl:if>
												<xsl:if test="floor(/ProductDetail/ShowOption div 256) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/BoxText"></xsl:value-of>
												</xsl:if>
												<xsl:if test="floor(/ProductDetail/ShowOption div 512) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/PairText"></xsl:value-of>
												</xsl:if>
												<xsl:if test="floor(/ProductDetail/ShowOption div 1024) mod 2 = 1">
													<xsl:text>/ </xsl:text>
													<xsl:value-of select="/ProductDetail/SquareText"></xsl:value-of>
												</xsl:if>
											</span></div>
										<div class="cart-item-quantity">
											<div class="input-group">
												<div class="input-group-btn">
													<div class="qty-minus btn-number"><em class="mdi mdi-minus"></em>
													</div>
												</div>
												<input class="product-details-quantity form-control input-number"
													type="text" value="1">
												<xsl:attribute name="name">
													<xsl:text>addtocart_</xsl:text>
													<xsl:value-of select="/ProductDetail/ProductId"
														disable-output-escaping="yes">
													</xsl:value-of>
													<xsl:text>.EnteredQuantity</xsl:text>
												</xsl:attribute>
												</input>
												<div class="input-group-btn">
													<div class="qty-plus btn-number"><em class="mdi mdi-plus"></em>
													</div>
												</div>
											</div>
										</div>
										<a class="cart-item-buy" href="javascript:;"
											onclick="AjaxCart.addproducttocart_details(this); return false;">
											<xsl:attribute name="data-productid">
												<xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
											</xsl:attribute>
											<em class="mdi mdi-cart"></em>
											<span>
												<xsl:value-of select="/ProductDetail/BuyNow"></xsl:value-of>
											</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 product-detail-information">
						<div class="row no-gutters pd-line">
							<div class="col-sm-4">
								<h4>
									<xsl:value-of select="/ProductDetail/ProductNameLabel"></xsl:value-of>
								</h4>
							</div>
							<div class="col-sm-8">
								<p>
									<xsl:value-of select='/ProductDetail/Title'></xsl:value-of>
									<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes">
									</xsl:value-of>
								</p>
							</div>
						</div>
						<div class="row no-gutters pd-line">
							<div class="col-sm-4">
								<h4>
									<xsl:value-of select="/ProductDetail/CodeLabel"></xsl:value-of>
								</h4>
							</div>
							<div class="col-sm-8">
								<h5 class="code">
									<xsl:value-of select='/ProductDetail/Code'></xsl:value-of>
								</h5>
							</div>
						</div>
						<xsl:apply-templates select='/ProductDetail/ProductAttributes' mode="Full">
						</xsl:apply-templates>
						<div class="row no-gutters product-detail-support-row">
							<!-- <xsl:if test="/ProductDetail/FileUrl != ''"> -->
							<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support ">
								<a target="_blank">
									<xsl:attribute name='href'>
										<xsl:value-of select='/ProductDetail/FileUrl'></xsl:value-of>
									</xsl:attribute>
									<img src="/Data/Sites/1/skins/default/img/san-pham-ct/icon-pdf.png"
										alt="pdf file" />
									<p>
										<xsl:value-of select="/ProductDetail/ManualDocument"></xsl:value-of>
									</p>
								</a>
							</div>
							<!-- </xsl:if> -->
							<!-- <xsl:if test="/ProductDetail/SubTitle != ''"> -->
							<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support">
								<a data-fancybox="gallery">
									<xsl:attribute name='href'>
										<xsl:value-of select='/ProductDetail/SubTitle' disable-output-escaping='yes'>
										</xsl:value-of>
									</xsl:attribute>
									<em class="mdi mdi-video"></em>
									<p>Video clip</p>
								</a>
							</div>
							<!-- </xsl:if> -->
							<!-- <xsl:if test="/ProductDetail/BriefContent != ''"> -->
							<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support">
								<a target="_blank">
									<xsl:attribute name='href'>
										<xsl:value-of select='/ProductDetail/BriefContent'></xsl:value-of>
									</xsl:attribute>
									<em class="mdi mdi-file-document"></em>
									<p>
										<xsl:value-of select="/ProductDetail/InstallationInstructions"></xsl:value-of>
									</p>
								</a>
							</div>
							<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support">
								<a target="_blank">
									<!-- <xsl:attribute name='href'>
										<xsl:value-of select='/ProductDetail/BriefContent'></xsl:value-of>
									</xsl:attribute> -->
									<em class="mdi mdi-view-360"></em>
									<p>View 360</p>
								</a>
							</div>
							<!-- </xsl:if> -->
						</div>
						<div class="social-network"></div>
					</div>
					<!-- <div class="col-lg-6">
						<div class="product-detail-information">
							<h2>
								<xsl:value-of select='/ProductDetail/Title'></xsl:value-of>
								<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes">
								</xsl:value-of>
							</h2>
							<h3>
								<xsl:value-of select='/ProductDetail/Price'></xsl:value-of>
							</h3>
							<div class="add-cart-wrapper">
								<div class="cart-item-quantity">
									<div class="input-group">
										<div class="input-group-btn">
											<div class="qty-minus btn-number"><em class="mdi mdi-minus"></em></div>
										</div>
										<input class="product-details-quantity form-control input-number" type="text"
											value="1">
										<xsl:attribute name="name">
											<xsl:text>addtocart_</xsl:text>
											<xsl:value-of select="/ProductDetail/ProductId"
												disable-output-escaping="yes">
											</xsl:value-of>
											<xsl:text>.EnteredQuantity</xsl:text>
										</xsl:attribute>
										</input>
										<div class="input-group-btn">
											<div class="qty-plus btn-number"><em class="mdi mdi-plus"></em></div>
										</div>
									</div>
								</div>
								<a class="cart-item-buy" href="javascript:;"
									onclick="AjaxCart.addproducttocart_details(this); return false;">
									<xsl:attribute name="data-productid">
										<xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
									</xsl:attribute>
									<em class="mdi mdi-cart"></em>
									<span>Mua ngay</span>
								</a>
							</div>
							<div class="row pd-line">
								<div class="col-sm-4">
									<h4>Mã số</h4>
								</div>
								<div class="col-sm-8">
									<h5>
										<xsl:value-of select='/ProductDetail/Code'></xsl:value-of>
									</h5>
								</div>
							</div>
							<xsl:apply-templates select='/ProductDetail/ProductAttributes'></xsl:apply-templates>
							<div class="row pd-line">
								<div class="social-network"></div>
							</div>
							<div class="row">
								<xsl:if test="/ProductDetail/FileUrl != ''">
									<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support "
										style="padding-left: 0px">
										<a target="_blank">
											<xsl:attribute name='href'>
												<xsl:value-of select='/ProductDetail/FileUrl'></xsl:value-of>
											</xsl:attribute>
											<img src="/Data/Sites/1/skins/default/img/san-pham-ct/icon-pdf.png"
												alt="pdf file" />
											<p>tài liệu hướng dẫn</p>
										</a>
									</div>
								</xsl:if>
								<xsl:if test="/ProductDetail/SubTitle != ''">
									<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support">
										<a data-fancybox="gallery">
											<xsl:attribute name='href'>
												<xsl:value-of select='/ProductDetail/SubTitle'
													disable-output-escaping='yes'>
												</xsl:value-of>
											</xsl:attribute>
											<em class="mdi mdi-video"></em>
											<p>Video clip</p>
										</a>
									</div>
								</xsl:if>
								<xsl:if test="/ProductDetail/BriefContent != ''">
									<div class="col-sm-6 col-lg-12 col-xl-6 product-detail-support">
										<a target="_blank">
											<xsl:attribute name='href'>
												<xsl:value-of select='/ProductDetail/BriefContent'></xsl:value-of>
											</xsl:attribute>
											<em class="mdi mdi-file-document"></em>
											<p>Hướng dân lắp đặt</p>
										</a>
									</div>
								</xsl:if>
							</div>
						</div>
					</div> -->
				</div>
				<div class="row bottom-detail">
					<div class="col-lg-6">

					</div>
					<div class="col-lg-6">

					</div>
				</div>
				<xsl:if test="/ProductDetail/FullContent != ''">
					<div class="product-tabs">
						<div class="tabs">
							<ul>
								<li><a href="#tab-1">
										<xsl:value-of select="/ProductDetail/ProductDetailsText"></xsl:value-of>
									</a></li>
								<!-- <li><a href="#tab-2">hướng dẫn sử dụng</a></li>
                                <li><a href="#tab-3">hướng dẫn bảo hành</a></li> -->
							</ul>
							<div id="tab-1">
								<xsl:value-of select='/ProductDetail/FullContent' disable-output-escaping='yes'>
								</xsl:value-of>
							</div>
						</div>
					</div>
				</xsl:if>
			</section>
			<section class="product-slide">
				<div class="product-article-title">
					<h2>
						<xsl:value-of select="/ProductDetail/OtherProductText"></xsl:value-of>
					</h2>
				</div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select='/ProductDetail/ProductOther'></xsl:apply-templates>
					</div>
					<div class="swiper-prev"><span class="fas fa-chevron-left"></span></div>
					<div class="swiper-next"><span class="fas fa-chevron-right"></span></div>
				</div>
			</section>
		</div>
	</xsl:template>
	<xsl:template match='ProductImages' mode="ContentImg">
		<xsl:if test="position() = 1">
			<img>
			<xsl:attribute name='src'>
				<xsl:value-of select='ThumbnailUrl'></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name='alt'>
				<xsl:value-of select='Title'></xsl:value-of>
			</xsl:attribute>
			</img>
		</xsl:if>
	</xsl:template>
	<xsl:template match='ProductImages' mode="BigThumbnail">
		<div class="swiper-slide">
			<a data-fancybox="gallery">
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>

				<div class="img">
					<img>
					<xsl:attribute name='src'>
						<xsl:value-of select='ImageUrl'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='alt'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
			</a>
		</div>
	</xsl:template>
	<xsl:template match='ProductImages' mode="SmallThumbnail">
		<div class="swiper-slide">
			<div class="img">
				<img>
				<xsl:attribute name='src'>
					<xsl:value-of select='ImageUrl'></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name='alt'>
					<xsl:value-of select='Title'></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</div>
	</xsl:template>
	<xsl:template match='ProductAttributes' mode="Full">
		<div class="row pd-line no-gutters">
			<div class="col-sm-4">
				<h4>
					<xsl:value-of select='Title'></xsl:value-of>
				</h4>
			</div>
			<div class="col-sm-8">
				<p>
					<xsl:value-of select='Content' disable-output-escaping='yes'></xsl:value-of>
				</p>
			</div>
		</div>
	</xsl:template>
	<!-- <xsl:template match="ProductAttributes" mode="Dvt">
		<xsl:if test="position()=7">
			<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
		</xsl:if>
	</xsl:template> -->
	<xsl:template match='ProductOther'>
		<div class="swiper-slide">
			<div class="item">
				<div class="figure">
					<a class="figure-image shine">
						<xsl:attribute name='href'>
							<xsl:value-of select='Url'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='target'>
							<xsl:value-of select='Target'></xsl:value-of>
						</xsl:attribute>
						<img>
						<xsl:attribute name='src'>
							<xsl:value-of select='ImageUrl'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='alt'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
					<div class="figure-caption">
						<h4>
							<xsl:text>MS: </xsl:text>
							<xsl:value-of select='Code'></xsl:value-of>
						</h4>
						<p>
							<a>
								<xsl:attribute name='href'>
									<xsl:value-of select='Url'></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name='title'>
									<xsl:value-of select='Title'></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of select='Title'></xsl:value-of>
							</a>
							<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
						</p>
						<h5>
							<xsl:value-of select='Price'></xsl:value-of>
						</h5>
					</div>
					<div class="item-cart">
						<a href="javascript:;" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
							<xsl:attribute name="data-productid">
								<xsl:value-of select="ProductId"></xsl:value-of>
							</xsl:attribute>
							<em class="mdi mdi-cart"></em>
							<span>
								<xsl:value-of select="/ProductDetail/AddToCartText"></xsl:value-of>
							</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>