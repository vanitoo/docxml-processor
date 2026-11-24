<?xml version="1.0" encoding="UTF-8"?>
<!--Приказ ФНС России от 13.11.2019 № ММВ-7-1/570@ "Об утверждении форматов представления экземпляра составленной годовой бухгалтерской (финансовой) отчетности и аудиторского заключения о ней в виде электронных документов в целях формирования государственного информационного ресурса бухгалтерской (финансовой) отчетности" Приложение №1 Таблица 4.10, Приложение №2 Таблица 4.7
Форма баланса - Приложение № 1 к приказу Минфина РФ от 2 июля 2010 г. № 66н-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:buhbal="urn:customs.ru:Information:WarehouseDocuments:BuhBalance:5.24.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="buhbal:BuhBalance">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<title>Бухгалтерский баланс</title>
				<style type="text/css">
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 250mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 5mm 5mm 5mm 5mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top: 5mm;}

					table
					{width: 100%;
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					div.title, tr.title td
					{font-weight:bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align: top;}

					td.value.graphMain
					{vertical-align: bottom;}
	
					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align: top;}

					.indent
					{text-indent: 1.5em;}

					.delim_3
					{height: 3pt;}

					.graphLittle
					{font-size: 6pt;
					text-align: center;
					vertical-align: top;}

					.delim_3
					{height: 3pt;}

					.graphMain
					{font-family: Arial;
					font-size: 9pt;}

					@media print
					{div.page
					{border: none;}}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b><xsl:text>Бухгалтерский баланс</xsl:text></b>
										<br/>
										<b><xsl:text>на </xsl:text>
										<xsl:if test="buhbal:ReportingDate">
											<span class="value">
												<xsl:for-each select="buhbal:ReportingDate">
													<xsl:call-template name="Date">
														<xsl:with-param name="dateIn" select="buhbal:ReportingDate"/>
													</xsl:call-template>
												</xsl:for-each>
											</span>
										</xsl:if>
										<xsl:if test="not(buhbal:ReportingDate)">
											<xsl:text>_______________ 20___ г.</xsl:text>
										</xsl:if></b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="graphMain">
						<tbody>
							<tr>
								<td class="delim_3" width="50%">
									<br/>
								</td>
								<td class="delim_3" width="25%">
									<br/>
								</td>
								<td align="center" valign="middle" class="bordered" width="25%">
									<xsl:text>Коды</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
								<td align="right" valign="middle" class="graphMain">
									<xsl:text>Форма по ОКУД</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered">
									<xsl:apply-templates select="buhbal:Organization/buhbal:OKUDCode"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
								<td align="right" valign="middle" class="graphMain">
									<xsl:text>Дата (число, месяц, год)</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered">
									<table width="100%">
										<tbody>
											<tr>
												<td align="center" class="graphMain" width="25%" style="border-right: solid 1px black;">
													<xsl:value-of select="substring(buhbal:ReportingDate, 9, 2)"/>
												</td>
												<td align="center" class="graphMain" width="50%" style="border-right: solid 1px black;">
													<xsl:variable name="month" select="substring(buhbal:ReportingDate, 6, 2)"/>
													<xsl:choose>
														<xsl:when test="$month=01"><xsl:text>января</xsl:text></xsl:when>
														<xsl:when test="$month=02"><xsl:text>февраля</xsl:text></xsl:when>
														<xsl:when test="$month=03"><xsl:text>марта</xsl:text></xsl:when>
														<xsl:when test="$month=04"><xsl:text>апреля</xsl:text></xsl:when>
														<xsl:when test="$month=05"><xsl:text>мая</xsl:text></xsl:when>
														<xsl:when test="$month=06"><xsl:text>июня</xsl:text></xsl:when>
														<xsl:when test="$month=07"><xsl:text>июля</xsl:text></xsl:when>
														<xsl:when test="$month=08"><xsl:text>августа</xsl:text></xsl:when>
														<xsl:when test="$month=09"><xsl:text>сентября</xsl:text></xsl:when>
														<xsl:when test="$month=10"><xsl:text>октября</xsl:text></xsl:when>
														<xsl:when test="$month=11"><xsl:text>ноября</xsl:text></xsl:when>
														<xsl:when test="$month=12"><xsl:text>декабря</xsl:text></xsl:when>
													</xsl:choose>
												</td>
												<td align="center" class="graphMain" width="25%">
													<xsl:value-of select="substring(buhbal:ReportingDate, 1, 4)"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" valign="middle" class="graphMain">
									<xsl:text>Организация:&#160;</xsl:text>
									<span class="value">
										<xsl:text>&#160;&#160;</xsl:text>
										<xsl:value-of select="buhbal:Organization/cat_ru:OrganizationName"/>
										<xsl:if test="buhbal:Organization/cat_ru:ShortName">
											<xsl:text>&#160;(</xsl:text>
											<xsl:value-of select="buhbal:Organization/cat_ru:ShortName"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<xsl:text>&#160;&#160;</xsl:text>
									</span>
								</td>
								<td align="right" valign="middle" class="graphMain">
									<xsl:text>по ОКПО</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered">
									<xsl:apply-templates select="buhbal:Organization/cat_ru:OKPOID"/>
								</td>
							</tr>
							<tr>
								<td align="left" valign="middle" class="graphMain">
									<xsl:text>Идентификационный номер налогоплательщика</xsl:text>
								</td>
								<td align="right" valign="middle" class="graphMain">
									<xsl:text>ИНН</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered">
									<xsl:apply-templates select="buhbal:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</td>
							</tr>
							<tr>
								<td align="left" valign="middle" class="graphMain">
									<xsl:text>Вид экономической деятельности:&#160;</xsl:text>
									<span class="value">
										<xsl:text>&#160;&#160;</xsl:text>
										<xsl:value-of select="buhbal:Organization/buhbal:EconomicActivity"/>
										<xsl:text>&#160;&#160;</xsl:text>
									</span>
								</td>
								<td align="right" valign="middle" class="graphMain">
									<xsl:text>по ОКВЭД 2</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered">
									<xsl:apply-templates select="buhbal:Organization/buhbal:EconomicActivityCode"/>
								</td>
							</tr>
							<tr>
								<td align="left" valign="middle" class="graphMain">
									<xsl:text>Организационно-правовая форма/форма собственности:&#160;</xsl:text>
									<span class="value">
										<xsl:text>&#160;&#160;</xsl:text>
										<xsl:value-of select="buhbal:Organization/buhbal:FormOfOwnership"/>
										<xsl:text>&#160;&#160;</xsl:text>
									</span>
								</td>
								<td align="right" valign="middle" class="graphMain">
									<xsl:text>по ОКОПФ/ОКФС</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered">
									<table width="100%">
										<tbody>
											<tr>
												<!--td align="center" class="graphMain" width="50%" style="border-right: solid 1px black;">
													<xsl:apply-templates select="."/>
												</td>
												<td align="center" class="graphMain" width="50%">
													<xsl:apply-templates select="."/>
												</td-->
												<td align="center" class="graphMain" width="100%">
													<xsl:apply-templates select="buhbal:Organization/buhbal:OKOPF_OKFSCode"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" valign="middle" class="graphMain">
									<xsl:text>Единица измерения: тыс.руб.</xsl:text>
								</td>
								<td align="right" valign="middle" class="graphMain">
									<xsl:text>по ОКЕИ</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered">
									<xsl:text>384</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="left" valign="middle" class="graphMain">
									<xsl:text>Местонахождение (адрес):&#160;</xsl:text>
									<span class="value">
										<xsl:text>&#160;&#160;</xsl:text>
										<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:PostalCode">
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="buhbal:Organization/cat_ru:Address/cat_ru:PostalCode"/>
										</xsl:if>
										<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:CounryName">
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="buhbal:Organization/cat_ru:Address/cat_ru:CounryName"/>
										</xsl:if>
										<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:CountryCode">
											<xsl:text>&#160;(</xsl:text>
											<xsl:value-of select="buhbal:Organization/cat_ru:Address/cat_ru:CountryCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:Region">
											<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:CountryCode or buhbal:Organization/cat_ru:Address/cat_ru:CounryName">
												<xsl:text>,&#160;</xsl:text>
											</xsl:if>
											<xsl:value-of select="buhbal:Organization/cat_ru:Address/cat_ru:Region"/>
										</xsl:if>
										<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:City">
											<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:CountryCode or buhbal:Organization/cat_ru:Address/cat_ru:CounryName or buhbal:Organization/cat_ru:Address/cat_ru:Region">
												<xsl:text>,&#160;</xsl:text>
											</xsl:if>
											<xsl:value-of select="buhbal:Organization/cat_ru:Address/cat_ru:City"/>
										</xsl:if>
										<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:StreetHouse">
											<xsl:if test="buhbal:Organization/cat_ru:Address/cat_ru:CountryCode or buhbal:Organization/cat_ru:Address/cat_ru:CounryName or buhbal:Organization/cat_ru:Address/cat_ru:Region or buhbal:Organization/cat_ru:Address/cat_ru:City">
												<xsl:text>,&#160;</xsl:text>
											</xsl:if>
											<xsl:value-of select="buhbal:Organization/cat_ru:Address/cat_ru:StreetHouse"/>
										</xsl:if>
										<xsl:text>&#160;&#160;</xsl:text>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<hr/>
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="left" valign="middle" class="graphMain" width="55%">
									<xsl:text>Бухгалтерская отчетность подлежит обязательному аудиту</xsl:text>
								</td>
								<xsl:variable name="xpath_Audit">
									<xsl:call-template name="get_xpath">
										<xsl:with-param name="node" select="buhbal:MandatoryAuditSign"/>
									</xsl:call-template>
								</xsl:variable>
								<td align="center" valign="middle" class="bordered" width="5%">
									<element xml_node="{$xpath_Audit}">
										<xsl:choose>
											<xsl:when test="(number(buhbal:MandatoryAuditSign)=1) or (buhbal:MandatoryAuditSign='t') or (buhbal:MandatoryAuditSign='true')">
												<span class="graphBold">х</span>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</element>
								</td>
								<td align="left" valign="middle" class="graphMain" width="10%">
									<xsl:text>ДА</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered" width="5%">
									<element xml_node="{$xpath_Audit}">
										<xsl:choose>
											<xsl:when test="(number(buhbal:MandatoryAuditSign)=0) or (buhbal:MandatoryAuditSign='f') or (buhbal:MandatoryAuditSign='false')">
												<span class="graphBold">х</span>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</element>
								</td>
								<td align="left" valign="middle" class="graphMain" width="10%">
									<xsl:text>НЕТ</xsl:text>
								</td>
								<td width="15%"/>
							</tr>
							<tr>
								<td align="left" valign="middle" class="graphMain">
									<xsl:text>Наименование аудиторской организации/фамилия, имя, отчество (при наличии) индивидуального аудитора:</xsl:text>
								</td>
								<td colspan="5"/>
							</tr>
							<tr>
								<td colspan="6" align="left" valign="middle" class="graphMain">
									<span class="value">
										<xsl:text>&#160;&#160;</xsl:text>
										<xsl:value-of select="buhbal:AuditOrganization/cat_ru:OrganizationName"/>
										<xsl:text>&#160;&#160;</xsl:text>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<hr/>
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="left" valign="middle" class="graphMain" width="50%">
									<xsl:text>Идентификационный номер налогоплательщика аудиторской организации/индивидуального аудитора</xsl:text>
								</td>
								<td align="right" valign="middle" class="graphMain" width="25%">
									<xsl:text>ИНН</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered" width="25%">
									<xsl:apply-templates select="buhbal:AuditOrganization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</td>
							</tr>
							<tr>
								<td align="left" valign="middle" class="graphMain" width="50%">
									<xsl:text>Основной государственный регистрационный номер аудиторской организации/индивидуального аудитора</xsl:text>
								</td>
								<td align="right" valign="middle" class="graphMain" width="25%">
									<xsl:text>ОГРН/ОГРНИП</xsl:text>
								</td>
								<td align="center" valign="middle" class="bordered" width="25%">
									<xsl:apply-templates select="buhbal:AuditOrganization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="graphMain">
						<tbody>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="buhbal:Full">
						<table class="graphMain">
							<tbody>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>Пояснения</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="34%">
										<b><xsl:text>Наименование показателя</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<b><xsl:text>Код</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На </xsl:text>
										<!--xsl:if test=".">
											<xsl:call-template name="Date">
												<xsl:with-param name="dateIn" select="."/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>___________</xsl:text>
											<br/>
											<xsl:text>20___</xsl:text>
										<!--/xsl:if-->
										<xsl:text> г.</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На 31 декабря </xsl:text>
										<br/>
										<!--xsl:if test=".">
											<span class="value">
												&#160;<xsl:value-of select="number(substring(., 1, 4)) - 1"/>&#160;
											</span>
											<xsl:text> г.</xsl:text>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>20___ г.</xsl:text>
										<!--/xsl:if--></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На 31 декабря </xsl:text>
										<br/>
										<!--xsl:if test=".">
											<span class="value">
												&#160;<xsl:value-of select="number(substring(., 1, 4)) - 2"/>&#160;
											</span>
											<xsl:text> г.</xsl:text>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>20___ г.</xsl:text>
										<!--/xsl:if--></b>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:IntangibleAssets/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>АКТИВ</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphMain">
														<br/>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>I. ВНЕОБОРОТНЫЕ АКТИВЫ</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphMain">
														<xsl:text>Нематериапьные активы</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1110</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:IntangibleAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:IntangibleAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:IntangibleAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ResearchResults/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Результаты исследований и разработок</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1120</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ResearchResults/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ResearchResults/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ResearchResults/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:IntangibleSearchAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Нематериальные поисковые активы</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1130</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:IntangibleSearchAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:IntangibleSearchAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:IntangibleSearchAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:TangibleSearchAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Материальные поисковые активы</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1140</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:TangibleSearchAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:TangibleSearchAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:TangibleSearchAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:FixedAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Основные средства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1150</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:FixedAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:FixedAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:FixedAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ProfitableInvestments/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Доходные вложения в материальные ценности</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1160</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ProfitableInvestments/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ProfitableInvestments/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ProfitableInvestments/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:FinancialInvestments/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Финансовые вложения</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1170</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:FinancialInvestments/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:FinancialInvestments/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:FinancialInvestments/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:DeferredTaxAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Отложенные налоговые активы</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1180</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:DeferredTaxAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:DeferredTaxAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:DeferredTaxAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:OtherNonCurrentAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Прочие внеоборотные активы</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1190</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:OtherNonCurrentAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:OtherNonCurrentAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:OtherNonCurrentAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Итого по разделу I</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1100</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:NonCurrentAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:Reserves/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>II. ОБОРОТНЫЕ АКТИВЫ</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphMain">
														<xsl:text>Запасы</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1210</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:Reserves/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:Reserves/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:Reserves/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:ValueAddedTax/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Налог на добавленную стоимость по приобретенным ценностям</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1220</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:ValueAddedTax/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:ValueAddedTax/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:ValueAddedTax/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:AccountsReceivable/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Дебиторская задолженность</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1230</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:AccountsReceivable/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:AccountsReceivable/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:AccountsReceivable/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:FinancialInvestments/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Финансовые вложения (за исключением денежных эквивалентов)</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1240</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:FinancialInvestments/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:FinancialInvestments/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:FinancialInvestments/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:MonetaryFunds/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Денежные средства и денежные эквиваленты</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1250</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:MonetaryFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:MonetaryFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:MonetaryFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:OtherCurrentAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Прочие оборотные активы</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1260</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:OtherCurrentAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:OtherCurrentAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:OtherCurrentAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Итого по разделу II</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1200</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:CurrentAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<b><xsl:text>БАЛАНС</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1600</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Activ/buhbal:PrecedingSumm"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="graphMain">
							<tbody>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="graphMain">
							<tbody>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>Пояснения</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="34%">
										<b><xsl:text>Наименование показателя</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<b><xsl:text>Код</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На </xsl:text>
										<!--xsl:if test=".">
											<xsl:call-template name="Date">
												<xsl:with-param name="dateIn" select="."/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>___________</xsl:text>
											<br/>
											<xsl:text>20___</xsl:text>
										<!--/xsl:if-->
										<xsl:text> г.</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На 31 декабря </xsl:text>
										<br/>
										<!--xsl:if test=".">
											<span class="value">
												&#160;<xsl:value-of select="number(substring(., 1, 4)) - 1"/>&#160;
											</span>
											<xsl:text> г.</xsl:text>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>20___ г.</xsl:text>
										<!--/xsl:if--></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На 31 декабря </xsl:text>
										<br/>
										<!--xsl:if test=".">
											<span class="value">
												&#160;<xsl:value-of select="number(substring(., 1, 4)) - 2"/>&#160;
											</span>
											<xsl:text> г.</xsl:text>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>20___ г.</xsl:text>
										<!--/xsl:if--></b>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:AuthorizedCapital/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>ПАССИВ</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphMain">
														<br/>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>III. КАПИТАЛ И РЕЗЕРВЫ</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphMain">
														<xsl:text>Уставный капитал (складочный капитал, уставный фонд, вклады товарищей)</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1310</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:AuthorizedCapital/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:AuthorizedCapital/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:AuthorizedCapital/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:OwnShares/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Собственные акции, выкупленные у акционеров</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1320</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:OwnShares/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:OwnShares/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:OwnShares/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:NonCurrentAssetsRevaluation/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Переоценка внеоборотных активов</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1340</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:NonCurrentAssetsRevaluation/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:NonCurrentAssetsRevaluation/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:NonCurrentAssetsRevaluation/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:AdditionalCapital/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Добавочный капитал (без переоценки)</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1350</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:AdditionalCapital/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:AdditionalCapital/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:AdditionalCapital/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:ReserveCapital/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Резервный капитал</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1360</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:ReserveCapital/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:ReserveCapital/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:ReserveCapital/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:RetainedEarnings/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Нераспределенная прибыль (непокрытый убыток)</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1370</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:RetainedEarnings/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:RetainedEarnings/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:RetainedEarnings/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Итого по разделу III</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1300</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:CapitalReserves/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:BorrowedFunds/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>IV. ДОЛГОСРОЧНЫЕ ОБЯЗАТЕЛЬСТВА</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphMain">
														<xsl:text>Заемные средства</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1410</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:BorrowedFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:BorrowedFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:BorrowedFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:DeferredTaxLiabilities/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Отложенные налоговые обязательства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1420</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:DeferredTaxLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:DeferredTaxLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:DeferredTaxLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:EstimatedLiabilities/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Оценочные обязательства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1430</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:EstimatedLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:EstimatedLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:EstimatedLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:OtherLiabilities/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Прочие обязательства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1450</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:OtherLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:OtherLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:OtherLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Итого по разделу IV</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1400</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:LongTermLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:BorrowedFunds/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>V. КРАТКОСРОЧНЫЕ ОБЯЗАТЕЛЬСТВА</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphMain">
														<xsl:text>Заемные средства</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1510</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:BorrowedFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:BorrowedFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:BorrowedFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:CreditorDebt/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Кредиторская задолженность</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1520</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:CreditorDebt/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:CreditorDebt/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:CreditorDebt/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:FutureIncome/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Доходы будущих периодов</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1530</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:FutureIncome/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:FutureIncome/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:FutureIncome/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:EstimatedLiabilities/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Оценочные обязательства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1540</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:EstimatedLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:EstimatedLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:EstimatedLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:OtherLiabilities/buhbal:Explanationn"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Прочие обязательства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1550</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:OtherLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:OtherLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:OtherLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Итого по разделу V</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1500</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ShortTermLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<!--tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:MutualFund/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>VI. ЦЕЛЕВОЕ ФИНАНСИРОВАНИЕ</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphMain">
														<xsl:text>Паевой фонд</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1610</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:MutualFund/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:MutualFund/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:MutualFund/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TargetCapital/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Целевой капитал</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1620</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TargetCapital/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TargetCapital/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TargetCapital/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TargetedFunds/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Целевые средства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1630</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TargetedFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TargetedFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TargetedFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:PropertyFund/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Фонд недвижимого и особо ценного движимого имущества</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1640</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:PropertyFund/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:PropertyFund/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:PropertyFund/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TrustFunds/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Резервный и иные целевые фонды</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1650</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TrustFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TrustFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:TrustFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Итого по разделу VI</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1600</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:TargetFinancing/buhbal:PrecedingSumm"/>
									</td>
								</tr-->
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<b><xsl:text>БАЛАНС</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1700</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Full/buhbal:Passiv/buhbal:PrecedingSumm"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="buhbal:Simplified">
						<table class="graphMain">
							<tbody>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>Пояснения</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="34%">
										<b><xsl:text>Наименование показателя</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<b><xsl:text>Код</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На </xsl:text>
										<!--xsl:if test=".">
											<xsl:call-template name="Date">
												<xsl:with-param name="dateIn" select="."/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>___________</xsl:text>
											<br/>
											<xsl:text>20___</xsl:text>
										<!--/xsl:if-->
										<xsl:text> г.</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На 31 декабря </xsl:text>
										<br/>
										<!--xsl:if test=".">
											<span class="value">
												&#160;<xsl:value-of select="number(substring(., 1, 4)) - 1"/>&#160;
											</span>
											<xsl:text> г.</xsl:text>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>20___ г.</xsl:text>
										<!--/xsl:if--></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<b><xsl:text>На 31 декабря </xsl:text>
										<br/>
										<!--xsl:if test=".">
											<span class="value">
												&#160;<xsl:value-of select="number(substring(., 1, 4)) - 2"/>&#160;
											</span>
											<xsl:text> г.</xsl:text>
										</xsl:if>
										<xsl:if test="not(.)">-->
											<xsl:text>20___ г.</xsl:text>
										<!--/xsl:if--></b>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:TangibleNonCurrentAssets/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>АКТИВ</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphMain">
														<br/>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphMain">
														<xsl:text>Материальные внеоборотные активы</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1150</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:TangibleNonCurrentAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:TangibleNonCurrentAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:TangibleNonCurrentAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:OtherNonCurrentAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Нематериальные, финансовые и другие внеоборотные активы</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1170</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:OtherNonCurrentAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:OtherNonCurrentAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:OtherNonCurrentAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:Reserves/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Запасы</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1210</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:Reserves/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:Reserves/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:Reserves/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:MonetaryFunds/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Денежные средства и денежные эквиваленты</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1250</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:MonetaryFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:MonetaryFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:MonetaryFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:OtherCurrentAssets/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Финансовые и другие оборотные активы</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1230</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:OtherCurrentAssets/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:OtherCurrentAssets/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:OtherCurrentAssets/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<b><xsl:text>БАЛАНС</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1600</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Activ/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:CapitalReserves/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<table width="100%">
											<tbody>
												<tr>
													<td align="center" class="graphMain">
														<b><xsl:text>ПАССИВ</xsl:text></b>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphMain">
														<br/>
													</td>
												</tr>
												<tr>
													<td align="left" class="graphMain">
														<xsl:text>Капиталы и резервы</xsl:text>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1300</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:CapitalReserves/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:CapitalReserves/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:CapitalReserves/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:LongTermBorrowedFunds/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<xsl:text>Долгосрочные заемные средства</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1410</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:LongTermBorrowedFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:LongTermBorrowedFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:LongTermBorrowedFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:OtherLongTermLiabilities/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Другие долгосрочные обязательства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1450</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:OtherLongTermLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:OtherLongTermLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:OtherLongTermLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:ShortTermBorrowedFunds/buhbal:Explanation"/>
									</td>
									<td valign="middle" class="bordered" width="34%">
										<xsl:text>Краткосрочные заемные средства</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="6%">
										<xsl:text>1510</xsl:text>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:ShortTermBorrowedFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:ShortTermBorrowedFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="bottom" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:ShortTermBorrowedFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:CreditorDebt/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Кредиторская задолженность</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1520</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:CreditorDebt/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:CreditorDebt/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:CreditorDebt/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:OtherShortTermLiabilities/buhbal:Explanationn"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Другие краткосрочные обязательства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1550</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:OtherShortTermLiabilities/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:OtherShortTermLiabilities/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:OtherShortTermLiabilities/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<!--tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:TargetedFunds/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Целевые средства</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1630</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:TargetedFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:TargetedFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:TargetedFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr>
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:TrustFunds/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<xsl:text>Фонд недвижимого и особо ценного движимого имущества</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1640</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:TrustFunds/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:TrustFunds/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:TrustFunds/buhbal:PrecedingSumm"/>
									</td>
								</tr-->
								<tr>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:Explanation"/>
									</td>
									<td align="left" valign="middle" class="bordered" width="34%">
										<b><xsl:text>БАЛАНС</xsl:text></b>
									</td>
									<td align="center" valign="middle" class="bordered" width="6%">
										<xsl:text>1700</xsl:text>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:ReportSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:PreviousSumm"/>
									</td>
									<td align="center" valign="middle" class="bordered" width="15%">
										<xsl:apply-templates select="buhbal:Simplified/buhbal:Passiv/buhbal:PrecedingSumm"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<!--table class="graphMain">
						<tbody>
							<tr>
								<td align="left" valign="middle" class="graphMain" width="20%">
									<xsl:text>Руководитель</xsl:text>
								</td>
								<td align="center" valign="middle" class="graphMain" width="10%">
									<span class="value">
										<xsl:text>&#160;&#160;</xsl:text>
										<xsl:value-of select="."/>
										<xsl:text>&#160;&#160;</xsl:text>
									</span>
								</td>
								<td align="center" valign="middle" class="graphMain" width="30%">
									<span class="value">
										<xsl:text>&#160;&#160;</xsl:text>
										<xsl:value-of select="."/>
										<xsl:text>&#160;&#160;</xsl:text>
									</span>
								</td>
								<td class="delim_3" width="40%">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="delim_3" width="20%">
									<br/>
								</td>
								<td align="center" valign="middle" class="graphLittle" width="10%">
									<xsl:text>(подпись)</xsl:text>
								</td>
								<td align="center" valign="middle" class="graphLittle" width="30%">
									<xsl:text>(расшифровка подписи)</xsl:text>
								</td>
								<td class="delim_3" width="40%">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="4" align="left" valign="middle" class="graphMain">
									<xsl:call-template name="Date">
										<xsl:with-param name="dateIn" select="."/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table-->
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="Date">
		<xsl:value-of select="substring (., 9, 2)"/>&#160;
		<xsl:variable name="month" select="substring(., 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=01">января</xsl:when>
			<xsl:when test="$month=02">февраля</xsl:when>
			<xsl:when test="$month=03">марта</xsl:when>
			<xsl:when test="$month=04">апреля</xsl:when>
			<xsl:when test="$month=05">мая</xsl:when>
			<xsl:when test="$month=06">июня</xsl:when>
			<xsl:when test="$month=07">июля</xsl:when>
			<xsl:when test="$month=08">августа</xsl:when>
			<xsl:when test="$month=09">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose>&#160;					
		<xsl:value-of select="substring(., 1, 4)"/>&#160;г.
	</xsl:template>

	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
</xsl:stylesheet>
