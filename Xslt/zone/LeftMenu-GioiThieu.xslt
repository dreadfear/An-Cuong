<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:if test="count(/ZoneList/Zone) > 0">
			<section class="sidebar-index">
				<div class="sidebar-toggle">
					<span class="mdi mdi-menu"></span><span class="text">Danh mục</span>
				</div>
				<ul class="sidebar-index-wrappper">
					<xsl:apply-templates select='/ZoneList/Zone'></xsl:apply-templates>
				</ul>
			</section>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Zone">
		<li>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name='class'>
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="count(Zone)>0">
				<xsl:attribute name='class'>
					<xsl:text>have-children</xsl:text>
				</xsl:attribute>
				<xsl:if test="IsActive='true'">
					<xsl:attribute name='class'>
						<xsl:text>have-children active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<a>
					<xsl:attribute name='href'>
						<xsl:text>javascript:;</xsl:text>
					</xsl:attribute>
					<xsl:attribute name='title'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select='Title'></xsl:value-of>
				</a>
				<ul>
					<xsl:apply-templates select='Zone' mode="Child"></xsl:apply-templates>
				</ul>
			</xsl:if>
			<xsl:if test="count(Zone)=0">
				<a>
					<xsl:attribute name='href'>
						<xsl:text>#section-</xsl:text>
						<xsl:value-of select='position()'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='title'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select='Title'></xsl:value-of>
				</a>
			</xsl:if>
		</li>
	</xsl:template>

	<xsl:template match="Zone" mode="Child">
		<li>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>