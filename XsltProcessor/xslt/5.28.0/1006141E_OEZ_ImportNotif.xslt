<?xml version="1.0" encoding="UTF-8"?>
<!--DocKind = 1, ZoneKind = 1, 3, 4 - Приказ 16н приложение 1 -->
<!--DocKind = 1, ZoneKind = 2 - Приказ 70н приложение 1 -->
<!--DocKind = 2 - Приказ 18н приложение 1 -->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:impn="urn:customs.ru:Information:CustomsDocuments:OEZ_ImportNotif:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.26.0">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes"/>
	<xsl:param name="OEZ_NotifReg"/>
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
	<xsl:template match="//*[local-name()='OEZ_ImportNotif']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn2" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="impn:OEZ_ImportNotif">
		<html>
			<head>
				<title>Уведомление/Разрешение о ввозе товаров и въезде средства транспорта на территорию ОЭЗ/ПОЭЗ</title>
				<style type="text/css">
					body
					{text-align: center;
					background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 297mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	10mm;
					background: #ffffff;
					border: solid .5pt #000000;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display: -moz-inline-stack;/*Firefox 2*/
					display: inline-table; /*Хорошие браузеры*/
					_overflow: hidden;/*IE6, IE7*/
					*zoom: 1;/*включаем hasLayout для IE6, IE7*/
					*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					.descr
					{font-size: 7pt;
					text-align: center;
					vertical-align:top;}

					table
					{table-layout: fixed;
					width: 100%;
					border: 0;
					/*empty-cells: show;*/
					border-collapse: collapse;
					margin-top: 0px;}

					td
					{font-family: Arial;}

					.normal
					{font-weight: bold;
					font-family:Arial;
					font-size: 10pt;
					border-left: medium none;
					border-right: medium none;
					border-top: medium none;
					border-bottom: 1pt solid windowtext;}

					.bold
					{font-weight: bold;
					font-family:Arial;
					font-size: 15pt;}

					.italic
					{font-style: italic; 
					font-family:Arial;
					font-size: 9pt}

					.graph
					{font-family: Arial;
					font-size: 10pt;
					font-weight: bold;}

					.graphMain
					{font-family: Arial;
					font-size: 10pt;
					font-weight: normal;}

					.graphMainbold
					{font-family: Arial;
					font-size: 10pt;
					font-weight:bold;}

					.graphLittle
					{font-family: Arial;
					font-size: 7pt;}

					.graph8Bold
					{font-family: Arial;
					font-size: 10pt;
					font-weight: bold;}

					.bordered
					{border-bottom: solid 1pt #000000;
					font-weight: bold;}

					.borderednormal
					{border-bottom: solid 1pt #000000;
					font-weight: normal;}

					.tdBorder
					{border: 1px solid black;}
					
					.squareCheckX {
							display: inline-block;
							width: 4mm;
							height: 4mm;
							border: 1px solid black;
							text-align: center;
						}
                </style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="impn:DocKind = 1">
							<xsl:choose>
								<xsl:when test="impn:ZoneKind = 1 or impn:ZoneKind = 3 or impn:ZoneKind = 4 or impn:ZoneKind = 5 or impn:ZoneKind = 6">
									<table border="0" style="width:297mm">
										<tbody>
											<tr>
												<td align="center" colspan="2" valign="top">
													<b>
														УВЕДОМЛЕНИЕ
														<br/>
														о ввозе товаров на территорию особой экономической зоны, 
														на участок территории опережающего развития, на земельный участок, 
														предоставленный резиденту свободного порта Владивосток, на участок 
														резидента Арктической зоны Российской Федерации, на которых 
														применяется таможенная процедура свободной таможенной зоны 
														(за исключением портовой особой экономической зоны, отдельных 
														участков морских портов, открытых для международного сообщения 
														и захода иностранных морских судов, включая акваторию морского 
														порта, и (или) отдельных участков территории аэропорта, открытого 
														для приема и отправки воздушных судов, выполняющих 
														международные воздушные перевозки, находящиеся на территории 
														свободного порта Владивосток, в Арктической зоне Российской 
														Федерации, на которых применяется таможенная процедура свободной таможенной 
														зоны, земельного участка, прилегающего к автомобильному или 
														железнодорожному пункту пропуска свободного порта Владивосток, 
														Арктической зоны Российской Федерации, на котором применяется 
														таможенная процедура свободной таможенной зоны, установленная для 
														логистической особой экономической зоны)
													</b>
													<br/>
													<br/>
													<xsl:text>№ </xsl:text>
													<xsl:call-template name="NotifNumber"/>
													<br/>
													<br/>
												</td>
											</tr>
											<tr>
												<td align="left" style="width:167mm" valign="top">
												</td>
												<td>
													<table style="width:130mm">
														<tbody>
															<tr>
																<td align="left" valign="top">B 
																	<xsl:apply-templates select="impn:Customs/cat_ru:Code"/>
																	<xsl:text> </xsl:text>
																	<xsl:apply-templates select="impn:Customs/cat_ru:OfficeName"/>
																</td>
															</tr>
															<tr>
																<td align="center" class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа (с указанием кода таможенного органа)</td>
															</tr>
															<tr>
																<td align="left">От 
																	<xsl:apply-templates select="impn:Applicant/cat_ru:OrganizationName"/> 
																	<xsl:if test="impn:Applicant/impn:Address">
																		<xsl:for-each select="impn:Applicant/impn:Address">
																			<xsl:apply-templates select="." mode="address"/>
																		</xsl:for-each> 
																	</xsl:if>
																	<xsl:if test="impn:Applicant/cat_ru:RFOrganizationFeatures">
																		<xsl:if test="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																		<xsl:if test="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																		<xsl:if test="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
																	</xsl:if>
																	<xsl:if test="impn:Applicant/impn:CertificateNumber">
																		свидетельство о включении в реестр № 
																		<xsl:apply-templates select="impn:Applicant/impn:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																		<xsl:apply-templates select="impn:Applicant/impn:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
																	</xsl:if>
																</td>
															</tr>
															<tr>
																<td align="center" class="graphLittle" style="border-top:1pt solid black">
																	<xsl:text>(резидент особой экономической зоны, резидент территории опережающего развития, резидент свободного порта Владивосок, резидент Арктической зоны Российской Федерации (далее - резидент) или лицо, им уполномоченное)</xsl:text>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr>
												<td align="left">
													<xsl:text>Настоящим уведомляю, что будет осуществлен ввоз товаров </xsl:text>
													<table class="inlinetable" style="width: 100mm;">
														<tbody>
															<tr align="center">
																<td class="value" width="100%;">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:apply-templates select="impn:ImportDate" mode="russian_date"/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</td>
															</tr>
															<tr align="center">
																<td class="descr">
																	(планируемая дата ввоза)
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td align="left">
													<xsl:text>на территорию (участка) </xsl:text>
													<br/>
													<table class="inlinetable" style="width: 100%;">
														<tbody>
															<tr align="center">
																<td class="value" width="100%;">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:apply-templates select="impn:AddressZone" mode="address"/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</td>
															</tr>
															<tr align="center">
																<td class="descr">
																	(место нахождения (адрес)
																</td>
															</tr>
														</tbody>
													</table>
													<br/>
													<xsl:text>согласно следующим сведениям:</xsl:text>
													<br/>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr align="left">
												<td width="50%">
													<xsl:text>Транспортное средство: </xsl:text>
													<br/>
													<xsl:apply-templates select="impn:TransportMeans"/>
												</td>
												<td width="50%">
													<xsl:text>Регистрационный номер транспортного средства:</xsl:text>
													<br/>
													<xsl:apply-templates select="impn:TransportMeans" mode="transport_numbers"/>
												</td>
											</tr>
											<tr align="left">
												<td colspan="2">
													<br/>
													<xsl:text>Регистрационный номер прицепа/полуприцепа:</xsl:text>
													<br/>
													<xsl:apply-templates select="impn:TransportMeans" mode="trailer_numbers"/>
												</td>
											</tr>
											<tr align="left">
												<td colspan="2">
													<br/>
													<xsl:text>Без транспортного средства (багаж)</xsl:text>
													<br/>
												</td>
											</tr>
											<tr align="left">
												<td colspan="2">
													<br/>
													<xsl:text>Сборный груз:</xsl:text>
													<br/>
													<xsl:choose>
														<xsl:when test="impn:CombinedCargo">
															<xsl:apply-templates select="impn:CombinedCargo"/>
														</xsl:when>
														<xsl:otherwise> - </xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
									<table width="100%" style="font-size: 9pt;">
										<tbody>
											<tr align="left">
												<td colspan="7">
													<xsl:text>Таблица "Сведения о ввозимых товарах"</xsl:text>
												</td>
											</tr>
											<tr align="center">
												<td class="tdBorder">№ п/п</td>
												<td class="tdBorder">Наименование товара</td>
												<td class="tdBorder">Количество, единица измерения</td>
												<td class="tdBorder">Статус товара</td>
												<td class="tdBorder">Идентификационные признаки</td>
												<td class="tdBorder">Регистрационный номер декларации на товары</td>
												<td class="tdBorder">Примечание (при наличии)</td>
											</tr>
											<tr align="center">
												<td class="tdBorder">1</td>
												<td class="tdBorder">2</td>
												<td class="tdBorder">3</td>
												<td class="tdBorder">4</td>
												<td class="tdBorder">5</td>
												<td class="tdBorder">6</td>
												<td class="tdBorder">7</td>
											</tr>
											<xsl:for-each select="impn:GoodsInfo">
												<tr align="left" valign="top" style="word-break:break-all;">
													<td class="tdBorder">
														<xsl:apply-templates select="impn:GoodsNumeric"/>
													</td>
													<td class="tdBorder">
														<xsl:apply-templates select="impn:GoodsDescription"/>
													</td>
													<td class="tdBorder">
														<xsl:apply-templates select="impn:SupplementaryQuantity" mode="quantity"/>
													</td>
													<td class="tdBorder">
														<xsl:apply-templates select="impn:GoodsStatus"/>
													</td>
													<td class="tdBorder">
														<xsl:apply-templates select="impn:GoodsIdentification"/>
														<br/>
														<xsl:for-each select="*[local-name() = 'GoodTrademark' or local-name() = 'GoodMarking' or local-name() = 'GoodsMark' or local-name() = 'GoodsModel' or local-name() = 'GoodsStandard' or local-name() = 'GoodsSort']">
															<xsl:if test="position() != 1">, </xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>
													<td class="tdBorder">
														<xsl:apply-templates select="impn:PreviousDoc"/>
													</td>
													<td class="tdBorder">
														<xsl:apply-templates select="impn:Note"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
									<br/>
									<table>
										<tbody>
											<tr>
												<td align="left">
													<xsl:text>Прошу провести идентификацию в отношении следующих товаров при их ввозе на территорию участка </xsl:text>
													<br/>
													<table class="inlinetable" style="width: 100%;">
														<tbody>
															<tr align="left">
																<td class="value" width="100%;">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:for-each select="impn:GoodsInfo[impn:IdentificationSign = 1 or translate(substring(impn:IdentificationSign, 1, 1), 't', 'T') = 'T']/impn:GoodsNumeric">
																		<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
																		<xsl:apply-templates select="."/>
																	</xsl:for-each>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</td>
															</tr>
															<tr align="center">
																<td class="descr">
																	(номер товара из графы № 1 Таблицы "Сведения о ввозимых товарах")
																</td>
															</tr>
														</tbody>
													</table>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
									<table width="100%">
										<tbody>
											<tr align="center">
												<td width="5%"/>
												<td/>
												<td width="25%"/>
												<td width="10%"/>
											</tr>
											<tr align="left">
												<td colspan="4">
													<xsl:text>Таблица "Перечень документов"</xsl:text>
												</td>
											</tr>
											<tr align="center">
												<td class="tdBorder">№ п/п</td>
												<td class="tdBorder">Наименование документа</td>
												<td class="tdBorder">Номер, дата документа</td>
												<td class="tdBorder">Количество листов документа</td>
											</tr>
											<tr align="center">
												<td class="tdBorder">1</td>
												<td class="tdBorder">2</td>
												<td class="tdBorder">3</td>
												<td class="tdBorder">4</td>
											</tr>
											<xsl:for-each select="impn:GoodsInfo/impn:Documents|impn:DocList|impn:PersonSignature[impn:AuthorityDoc]">
												<tr align="left">
													<td class="tdBorder" align="center">
														<!--xsl:apply-templates select="impn:Position"/-->
														<xsl:value-of select="position()"/>
													</td>
													<td class="tdBorder">
														<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														<xsl:apply-templates select="impn:AuthorityDoc/cat_ru:PrDocumentName"/>
													</td>
													<td class="tdBorder">
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:text> от </xsl:text>
															<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
														</xsl:if>
														<xsl:if test="impn:AuthorityDoc/cat_ru:PrDocumentNumber">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="impn:AuthorityDoc/cat_ru:PrDocumentNumber"/>
														</xsl:if>
														<xsl:if test="impn:AuthorityDoc/cat_ru:PrDocumentDate">
															<xsl:text> от </xsl:text>
															<xsl:apply-templates select="impn:AuthorityDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
														</xsl:if>
													</td>
													<td class="tdBorder">
														<xsl:apply-templates select="impn:SheetsNumber"/>
														<xsl:apply-templates select="impn:NumberSheetsAuthorityDoc"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
									<br/><br/><br/>
									<table border="0" style="width:297mm">
										<tbody>
											<tr>
												<td align="left" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
													<xsl:for-each select="impn:PersonSignature">
														<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
														<br/>
														<xsl:for-each select="*[contains(local-name(), 'ame')]">
															<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:if test="*[local-name() = 'AuthorityDoc']">
															<br/>
															<xsl:apply-templates select="*[local-name() = 'AuthorityDoc']" mode="doc"/>
														</xsl:if>
													</xsl:for-each>
													
													<xsl:if test="impn:ApplicantSign">
														<br/>
														<xsl:apply-templates select="impn:TrustedOrganization"/>
													</xsl:if>
												</td>
												<td align="center" style="width:60mm;" valign="top">
													<br/>
												</td>
												<td style="width:100mm; border-bottom: 1pt solid windowtext;">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="center" style="width:137mm" class="graphLittle">
													(резидент или лицо, им уполномоченное)
												</td>
												<td align="center" style="width:60mm;" valign="top">
													<br/>
												</td>
												<td align="center" style="width:100mm" class="graphLittle">
													(подпись)
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:when>
								<xsl:when test="impn:ZoneKind = 2 or impn:ZoneKind = 7">
									<table border="0" style="width:297mm">
										<tbody>
											<tr>
												<td align="center" colspan="2" valign="top">
													<b>
														Уведомление
														<br/>
														о ввозе товаров на территории портовых особых экономических зон, на отдельные участки свободнго порта 
														Республики Крым и города федерального значения Севастополь, на территории участков морских портов, 
														открытых для международного сообщения и захода иностранных морских судов, включая акваторию морского 
														порта, участков территории аэропорта, открытого для приема и отправки воздушных судов, выполняющих 
														международные воздушные перевозки, находящиеся на территории свободного порта Владивосток 
														или Арктической зоны Российской Федерации, земельного участка, прилегающего к автомобильным 
														или железнодорожному пункту пропуска свободного порта Владивосток или Арктической зоны 
														Российской Федерации, на которых применяется таможенная процедура свободной таможенной зоны
													</b>
													<br/>
													<br/>
												</td>
											</tr>
											<tr>
												<!--Head-->
												<td align="left" style="width:167mm" valign="top">
													<span style="display:inline-block; width: 100mm; border: 1px solid black;">
														Отметки таможенных органов
														<br/>
														Регистрационный № <xsl:call-template name="NotifNumber"/>
													</span>
												</td>
												<td>
													<table style="width:130mm">
														<tbody>
															<tr>
																<td align="left">
																	<span class="incline">B </span>
																	<xsl:apply-templates select="impn:Customs/cat_ru:Code"/> 
																	<!--xsl:if test="impn:ZoneKind!='4'"-->
																		<xsl:text> </xsl:text>
																		<xsl:apply-templates select="impn:Customs/cat_ru:OfficeName"/>
																	<!--/xsl:if-->
																</td>
															</tr>
															<tr align="center">
																<td class="graphLittle" style="border-top:1pt solid black">(наименование и код таможенного органа)</td>
															</tr>
															<tr>
																<td align="left">
																	<span class="incline">От </span>
				
																	<xsl:apply-templates select="impn:Applicant/cat_ru:OrganizationName"/> 
																	<xsl:if test="impn:Applicant/impn:Address">
																		<xsl:for-each select="impn:Applicant/impn:Address">
																			<xsl:apply-templates select="." mode="address"/>
																		</xsl:for-each> 
																	</xsl:if>
																	<xsl:if test="impn:Applicant/cat_ru:RFOrganizationFeatures">
																		<xsl:if test="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																		<xsl:if test="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																		<xsl:if test="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="impn:Applicant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
																	</xsl:if>
																	<xsl:if test="impn:Applicant/impn:CertificateNumber">
																		свидетельство о включении в реестр № 
																		<xsl:apply-templates select="impn:Applicant/impn:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																		<xsl:apply-templates select="impn:Applicant/impn:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
																	</xsl:if>
																</td>
															</tr>
															<tr>
																<td class="graphLittle" align="center" style="border-top:1pt solid black">
																	<xsl:if test="impn:ZoneKind='2'">(резитент особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации) (далее - резидент), или участник свободной экономической зоны (далее - участник), или лицо, которое вправе выступать декларантом товаров, вывозимых с территории портового логистического участка, при завершении действия таможенной процедуры свободной таможенной зоны на основании пункта 3 статьи 202 ТК ЕАЭС (далее - декларант), (полное наименование организации, основной государственный регистрационный номер (далее - ОГРН), идентификационный номер налогоплательщика (далее - ИНН) и код причины поставновки на учет в налоговом органе (далее - КПП), адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии),  адрес регистрации по месту жительства, ИНН, основной государственный регистрационный номер индивидуального предпринимателя (далее - ОГРНИП) - для физического лица; регистрационный номер свидетельства, удостоверяющего регистрацию лица в качестве резидента особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации), или свидетельства о включении в единый реестр участников свободной экономической зоны)</xsl:if>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td></td>
												<td align="left">
													<xsl:text>(на </xsl:text><xsl:apply-templates select="impn:DocPages"/><xsl:text> л.)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr align="left">
												<td>
													<br/><br/>
													<xsl:text>Настоящим уведомляю, что </xsl:text>
													<table class="inlinetable" style="width: 100mm;">
														<tbody>
															<tr align="center">
																<td class="value" width="100%;">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:apply-templates select="impn:ImportDate" mode="russian_date"/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</td>
															</tr>
															<tr align="center">
																<td class="descr">
																	(планируемая дата ввоза товаров)
																</td>
															</tr>
														</tbody>
													</table>
													<xsl:text> будет осуществлен ввоз:</xsl:text>
													<br/>
													<span class="squareCheckX"><xsl:if test="impn:ImportCode = 1">X</xsl:if></span><xsl:text> товаров</xsl:text><br/>
													<span class="squareCheckX"><xsl:if test="impn:ImportCode = 2">X</xsl:if></span><xsl:text> порожнего транспортного средства</xsl:text><br/>
													<span class="squareCheckX"><xsl:if test="impn:ImportCode = 3">X</xsl:if></span><xsl:text> самоходной строительной техники</xsl:text><br/>
													<span class="squareCheckX"><xsl:if test="impn:ImportCode = 5">X</xsl:if></span><xsl:text> без транспортного средства</xsl:text><br/>
													<!-- <добавлено 5.28.0> -->
													<span class="squareCheckX"><xsl:if test="impn:ImportCode = 8">X</xsl:if></span><xsl:text> товаров ЕАЭС, являющихся строительными материалыми для строительства и (или) реконструкции объектов инфраструктуры</xsl:text><br/>
													<!-- </добавлено 5.28.0> -->
												</td>
											</tr>
											<tr align="left">
												<td>
													<xsl:text>на участок:</xsl:text>
													<table class="inlinetable" style="width: 100%;">
														<tbody>
															<tr align="center">
																<td class="value" width="100%;">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:apply-templates select="impn:Resident"/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</td>
															</tr>
															<tr align="center">
																<td class="descr">
																	(резидент или участник(полное наименование организации, ОГРН, ИНН и КПП, адрес юридического лица в пределах его места нахождения - для юридического лица; 
																	фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства, ИНН, ОГРНИП - для физического лица; номер свидетельства, 
																	удостоверяющего регистрацию лица в качестве резидента особой экономической зоны (свободного порта Владивосток, Арктической зоны Российской Федерации, 
																	свидетельство о включении в единый реестр участниов свободной экономической зоны)
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr align="left">
												<td>
													<xsl:text>Цели ввоза товаров:</xsl:text>
													<br/>
													<span class="squareCheckX"><xsl:if test="impn:Purpose/impn:PurposeOfImport = 1">X</xsl:if></span><xsl:text> ввоз товаров, помещаемых (помещенных) под таможенную процедуру свободной таможенной зоны, резидентом или участником в целях:</xsl:text><br/>
														<span class="squareCheckX" style="margin-left: 10mm;"><xsl:if test="impn:Purpose/impn:PurpImpDetails = 1">X</xsl:if></span><xsl:text> хранения товаров</xsl:text><br/>
														<span class="squareCheckX" style="margin-left: 10mm;"><xsl:if test="impn:Purpose/impn:PurpImpDetails = 2">X</xsl:if></span><xsl:text> хранение товаров и их вывоза в соответствии с подпунктом 4 пункта 10 статьи 207 ТК ЕАЭС</xsl:text><br/>
														<span class="squareCheckX" style="margin-left: 10mm;"><xsl:if test="impn:Purpose/impn:PurpImpDetails = 3">X</xsl:if></span><xsl:text> совершения операций по переработке товаров</xsl:text><br/>
													<span class="squareCheckX"><xsl:if test="impn:Purpose/impn:PurposeOfImport = 2">X</xsl:if></span><xsl:text> ввоз товаров, помещаемых (помещенных) под таможенную процедуру свободной таможенной зоны, по договору оказания услуг по складированию (хранению) товаров, а также по подготовке товаров к транспортировке, включая дробление партии, формирование отправок, сортировку, упаковку, переупаковку, маркировку (далее - договор об оказании услуг)</xsl:text><br/>
													<span class="squareCheckX"><xsl:if test="impn:Purpose/impn:PurposeOfImport = 3">X</xsl:if></span><xsl:text> ввоз товаров, помещаемых под таможенную процедуру экспорта, переработки вне таможенной территории, временного вывоза, реэкспорта, специальную таможенную процедуру за пределами портового, логистического участка, по договору об оказании услуг</xsl:text><br/>
													<span class="squareCheckX"><xsl:if test="impn:Purpose/impn:PurposeOfImport = 4">X</xsl:if></span><xsl:text> ввоз товаров, помещенных под таможенную процедуру свободной таможенной зоны, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, которые были ранее вывезены без завершения таможенной процедуры свободной таможенной зоны в случах, установленных пунктом 4 статьи 205 ТК ЕАЭС</xsl:text><br/>
													<span class="squareCheckX"><xsl:if test="impn:Purpose/impn:PurposeOfImport = 5">X</xsl:if></span><xsl:text> ввоз товаров, не подлежащих помещению под таможенную процедуру свободной таможенной зоны</xsl:text><br/>
													<span class="squareCheckX"><xsl:if test="impn:Purpose/impn:PurposeOfImport = 6">X</xsl:if></span><xsl:text> иные цели </xsl:text><u><xsl:apply-templates select="impn:Purpose/impn:OtherPurposeDescription"/></u><br/>
												</td>
											</tr>
											<tr align="left">
												<td>
													<br/>
													<xsl:text>Договор на оказание услуг</xsl:text>
													<table class="inlinetable" style="width: 100mm;">
														<tbody>
															<tr align="center">
																<td class="value" width="100%;">
																	<xsl:if test="impn:ServiceAgreement/cat_ru:PrDocumentNumber">
																		<xsl:text> № </xsl:text>
																		<xsl:apply-templates select="impn:ServiceAgreement/cat_ru:PrDocumentNumber"/>
																	</xsl:if>
																	<xsl:if test="impn:ServiceAgreement/cat_ru:PrDocumentDate">
																		<xsl:text> от </xsl:text>
																		<xsl:apply-templates select="impn:ServiceAgreement/cat_ru:PrDocumentDate" mode="russian_date"/>
																	</xsl:if>
																</td>
															</tr>
															<tr align="center">
																<td class="descr">
																	(реквизиты договора (номер, дата)
																</td>
															</tr>
														</tbody>
													</table>
													<xsl:text>, заключенный с </xsl:text>
													<table class="inlinetable" style="width: 100%;">
														<tbody>
															<tr align="center">
																<td class="value" width="100%;">
																	<xsl:apply-templates select="impn:ServiceOrganization"/>
																</td>
															</tr>
															<tr align="center">
																<td class="descr">
																	(лицо, заключившее договор об оказании услуг, с резидентом или участником (полное наименование организации, ОГРН, ИНН и КПП, адрес юридического лица в пределах его места нахождения - для юридического лица, фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства физического лица, ИНН, ОГРНИП - для физического лица)
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
										<table>
											<tbody>
												<tr align="left">
													<td width="50%">
														<xsl:text>Транспортное средство: </xsl:text>
														<br/>
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="impn:TransportMeans"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr">
																		(тип/марка, наименование)
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
													<td width="50%">
														<xsl:text>Регистрационный номер транспортного средства:</xsl:text>
														<br/>
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="impn:TransportMeans" mode="transport_numbers"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr">
																		(государственный регистрационный номер, номер вагона, контейнер, номер рейса (при наличии)
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>	
										<br/>
										<br/>
										<table style="font-size: 8pt;">
											<tbody>
												<tr align="center">
													<td width="2%"/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
												</tr>
												<tr align="left">
													<td colspan="13">Сведения о ввозимых товарах:</td>
												</tr>
												<tr align="center" valign="top">
													<td class="tdBorder">№ п/п</td>
													<td class="tdBorder">Наименование товара</td>
													<td class="tdBorder">Код товара по ТН ВЭД</td>
													<td class="tdBorder">Идентифика ционные признаки</td>
													<td class="tdBorder">Рег. номер декларации на товары . номер товара (рег. номер транзитной декларации)</td>
													<td class="tdBorder">Рег. номер разрешения уполномо ченного таможенного органа</td>
													<td class="tdBorder">Кол-во товара</td>
													<td class="tdBorder">Единица измерения</td>
													<td class="tdBorder">Вес товара (нетто/брутто)</td>
													<td class="tdBorder">Вид упаковки</td>
													<td class="tdBorder">Кол-во грузовых мест</td>
													<td class="tdBorder">Статус товара для таможенных целей</td>
													<td class="tdBorder">Примечание</td>
												</tr>
												<tr align="center">
													<td class="tdBorder">1</td>
													<td class="tdBorder">2</td>
													<td class="tdBorder">3</td>
													<td class="tdBorder">4</td>
													<td class="tdBorder">5</td>
													<td class="tdBorder">6</td>
													<td class="tdBorder">7</td>
													<td class="tdBorder">8</td>
													<td class="tdBorder">9</td>
													<td class="tdBorder">10</td>
													<td class="tdBorder">11</td>
													<td class="tdBorder">12</td>
													<td class="tdBorder">13</td>
												</tr>
												<xsl:for-each select="impn:GoodsInfo">
													<tr align="left" valign="top" style="word-break:break-all;">
														<td class="tdBorder">
															<xsl:apply-templates select="impn:GoodsNumeric"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:GoodsDescription"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:GoodsTNVEDCode"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:GoodsIdentification"/>
															<br/>
															<xsl:for-each select="*[local-name() = 'GoodTrademark' or local-name() = 'GoodMarking' or local-name() = 'GoodsMark' or local-name() = 'GoodsModel' or local-name() = 'GoodsStandard' or local-name() = 'GoodsSort']">
																<xsl:if test="position() != 1">, </xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:PreviousDoc"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:PermitRegNumber"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:NetWeightQuantity"/>
															<xsl:if test="impn:NetWeightQuantity and impn:GrossWeightQuantity">/</xsl:if>
															<xsl:apply-templates select="impn:GrossWeightQuantity"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:PackagingKind"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:PackagesQuantity"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:GoodsStatus"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="impn:Note"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr align="left">
													<td>
														<xsl:text>Отправитель товаров</xsl:text>
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="impn:Consignor"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr">
																		(полное наименование организации, ОГРН, ИНН и КПП, адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства, ИНН, ОГРНИП - для физического лица)
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<table>
											<tbody>
												<tr align="left">
													<td>
														<xsl:text>Получатель товаров</xsl:text>
														<table class="inlinetable" style="width: 100%;">
															<tbody>
																<tr align="center">
																	<td class="value" width="100%;">
																		<xsl:apply-templates select="impn:Consignee"/>
																	</td>
																</tr>
																<tr align="center">
																	<td class="descr">
																		(полное наименование организации, ОГРН, ИНН и КПП, присвоенные юридическому лицу в соответствии с законодательством Российской Федерации, место нахождения и адрес юридического лица в пределах его местонахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства, ИНН, ОГРНИП - для физического лица)
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
										<br/><br/>
										<table width="100%">
											<tbody>
												<tr align="left">
													<td colspan="4">
														<xsl:text>Перечень документов</xsl:text>
													</td>
												</tr>
												<tr align="center">
													<td class="tdBorder">№ п/п</td>
													<td class="tdBorder">Наименование документа</td>
													<td class="tdBorder">Номер, дата документа</td>
												</tr>
												<tr align="center">
													<td class="tdBorder">1</td>
													<td class="tdBorder">2</td>
													<td class="tdBorder">3</td>
												</tr>
												<xsl:for-each select="impn:GoodsInfo/impn:Documents|impn:DocList">
													<tr align="left">
														<td class="tdBorder">
															<!--xsl:apply-templates select="impn:Position"/-->
															<xsl:value-of select="position()"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														</td>
														<td class="tdBorder">
															<xsl:if test="cat_ru:PrDocumentNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
															</xsl:if>
															<xsl:if test="cat_ru:PrDocumentDate">
																<xsl:text> от </xsl:text>
																<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
															</xsl:if>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										<br/><br/><br/>
										<table border="0" style="width:297mm">
											<tbody>
												<tr>
													<td align="left" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
														<xsl:for-each select="impn:PersonSignature">
															<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
															<br/>
															<xsl:for-each select="*[contains(local-name(), 'ame')]">
																<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
															<xsl:if test="*[local-name() = 'AuthorityDoc']">
																<br/>
																<xsl:apply-templates select="*[local-name() = 'AuthorityDoc']" mode="doc"/>
															</xsl:if>
														</xsl:for-each>
														<xsl:if test="impn:ApplicantSign">
														<br/>
														<xsl:apply-templates select="impn:TrustedOrganization"/>
														</xsl:if>
													</td>
													<td align="center" style="width:60mm;" valign="top">
														<br/>
													</td>
													<td style="width:100mm; border-bottom: 1pt solid windowtext;">
														<br/>
													</td>
												</tr>
												<tr>
													<td align="center" style="width:137mm" class="graphLittle">
														(должность, инициалы и фамилия резидента, участника или уполномоченного лица)
													</td>
													<td align="center" style="width:60mm;" valign="top">
														<br/>
													</td>
													<td align="center" style="width:100mm" class="graphLittle">
														(подпись)
													</td>
												</tr>
											</tbody>
										</table>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="impn:DocKind = 2">
							<table border="0" style="width:297mm">
								<tbody>
									<tr>
										<td align="center" colspan="2" valign="top">
											<b>
												РАЗРЕШЕНИЕ
												<br/>
												на ввоз товаров на территорию портовой собой экономической зоны, на земельный участок, прилегающий 
												к автомобильному или железнодорожному пункту пропуска свободного порта Владивосток, Арктической зоны 
												Российской Федерации, на котором применяется таможенная процедура свободной таможенной зоны, 
												установленная для логистической особой экономической зоны, на отдельные участки морских портов, открытых 
												для международного сообщения и захода иносранных морских судов, включая акваторию морского порта, 
												и (или) на отдельные участки территории аэропрта, открытого для приема и отправки воздушных судов, 
												выполняющих международные воздушные перевозки, находящиеся на территории свободного порта Республики 
												Крым и города федерального значения Севастополя, на которых применяется таможенная процедура свободной 
												таможенной зоны, установленная для портовой особой экономической зоны
											</b>
											<br/>
											<br/>
											<xsl:text>№ </xsl:text>
											<xsl:call-template name="NotifNumber"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>											
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Разрешается ввоз товаров</xsl:text>
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value" width="100%;">
															<xsl:apply-templates select="impn:Resident" mode="resolution"/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(резидент портовой особой экономической зоны, свободного порта Владивосток, Арктической зоны Российской федерации, участник свободной экономической зоны (далее - резидент или участник) или лицо, не являющееся резидентом или участником)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>для размещения</xsl:text>
											<table>
												<tbody>
													<tr align="left">
														<td>
															<xsl:text>Получатель товаров</xsl:text>
															<table class="inlinetable" style="width: 99%;">
																<tbody>
																	<tr align="center">
																		<td class="value" width="100%;">
																			<xsl:apply-templates select="impn:AddressZone"/>
																		</td>
																	</tr>
																	<tr align="center">
																		<td class="descr">
																			(место нахождения (адрес) участка резидента или участника или лица, не являющегося резидентом или участником)
																		</td>
																	</tr>
																</tbody>
															</table>
															<xsl:text>, </xsl:text>
															<br/>
															<xsl:text>по уведомлению </xsl:text>
															<table class="inlinetable" style="width: 100mm;">
																<tbody>
																	<tr align="center">
																		<td class="value" width="100%;">
																			<xsl:apply-templates select="impn:ImportNoticeRegNumber" mode="reg_num"/>
																		</td>
																	</tr>
																	<tr align="center">
																		<td class="descr">
																			(регистрационный номер уведомления о ввозе товаров)
																		</td>
																	</tr>
																</tbody>
															</table>
															<xsl:text> согласно следующим сведениям:</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table style="font-size: 9pt;">
								<tbody>
									<tr align="center" valign="top">
										<td class="tdBorder" rowspan="2">№ п/п</td>
										<td class="tdBorder" rowspan="2">Наименование товара</td>
										<td class="tdBorder" rowspan="2">Код товара по ТН ВЭД</td>
										<td class="tdBorder" rowspan="2">Кол-во / единица измерения</td>
										<td class="tdBorder" rowspan="2">Кол-во грузовых мест</td>
										<td class="tdBorder" rowspan="2">Вес товара, кг</td>
										<td class="tdBorder" rowspan="2">Вид упаковки</td>
										<td class="tdBorder" rowspan="2">Статус товара</td>
										<td class="tdBorder" colspan="2">Основание для ввоза товаров</td>
									</tr>
									<tr align="center" valign="top">
										<td class="tdBorder">договор хранения (при наличии) (наименование, номер, дата)</td>
										<td class="tdBorder">сведения о лице, заключившем договор хранения</td>
									</tr>
									<tr align="center">
										<td class="tdBorder">1</td>
										<td class="tdBorder">2</td>
										<td class="tdBorder">3</td>
										<td class="tdBorder">4</td>
										<td class="tdBorder">5</td>
										<td class="tdBorder">6</td>
										<td class="tdBorder">7</td>
										<td class="tdBorder">8</td>
										<td class="tdBorder">9</td>
										<td class="tdBorder">10</td>
									</tr>
									<xsl:for-each select="impn:GoodsInfo">
										<tr align="left" valign="top">
											<td class="tdBorder">
												<xsl:apply-templates select="impn:GoodsNumeric"/>
											</td>
											<td class="tdBorder">
												<xsl:apply-templates select="impn:GoodsDescription"/>
											</td>
											<td class="tdBorder">
												<xsl:apply-templates select="impn:GoodsTNVEDCode"/>
											</td>
											<td class="tdBorder">
												<xsl:apply-templates select="impn:SupplementaryQuantity" mode="quantity"/>
											</td>
											<td class="tdBorder">
												<xsl:apply-templates select="impn:PackagesQuantity"/>
											</td>
											<td class="tdBorder">
												<xsl:apply-templates select="impn:GrossWeightQuantity"/>
												<xsl:if test="impn:GrossWeightQuantity and impn:NetWeightQuantity">/</xsl:if>
												<xsl:apply-templates select="impn:NetWeightQuantity"/>
											</td>
											<td class="tdBorder">
												<xsl:apply-templates select="impn:PackagingKind"/>
											</td>
											<td class="tdBorder">
												<xsl:apply-templates select="impn:GoodsStatus"/>
											</td>
											<td class="tdBorder"></td>
											<td class="tdBorder"></td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td align="left">
											<br/>Таблица "Перечень документов"<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="70%">
												<tbody>
													<tr>
														<td class="tdBorder" width="10%">№ п/п</td>
														<td class="tdBorder" width="50%">Наименование документов</td>
														<td class="tdBorder" width="40%">Реквизиты (номер, дата) документа</td>
													</tr>
													<tr align="center">
														<td class="tdBorder">1</td>
														<td class="tdBorder">2</td>
														<td class="tdBorder">3</td>
													</tr>
													<xsl:for-each select="impn:DocList">
														<xsl:variable name="pos" select="position()"/>
														<tr>
															<td class="tdBorder">
																<xsl:number value="position()"/>
															</td>
															<td class="tdBorder">
																<xsl:apply-templates select="cat_ru:PrDocumentName"/>
															</td>
															<td class="tdBorder" align="center">
																№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/> от <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Транспортное средсво / без транспортного средства</xsl:text>
											<br/>
											<xsl:apply-templates select="impn:TransportMeans"/>
											<br/>
											<xsl:apply-templates select="impn:TransportMeans" mode="transport_numbers"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Сборный груз</xsl:text>
											<br/>
											<xsl:apply-templates select="impn:CombinedCargo"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr align="left">
										<td>
											<xsl:text>Срок действия настоящего разрешения </xsl:text>
											<br/>
											<xsl:apply-templates select="impn:LimitDate" mode="russian_date"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/><br/><br/>
									<table border="0" style="width:297mm">
										<tbody>
											<tr>
												<td align="left" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
													<xsl:for-each select="impn:CustomsPerson">
														<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
														<br/>
														<xsl:for-each select="*[contains(local-name(), 'ame')]">
															<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</xsl:for-each>
												</td>
												<td align="center" style="width:60mm;" valign="top">
													<br/>
												</td>
												<td style="width:100mm; border-bottom: 1pt solid windowtext;">
													<br/>
												</td>
											</tr>
											<tr>
												<td align="center" style="width:137mm" class="graphLittle">
													(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)
												</td>
												<td align="center" style="width:60mm;" valign="top">
													<br/>
												</td>
												<td align="center" style="width:100mm" class="graphLittle">
													(подпись)
												</td>
											</tr>
										</tbody>
									</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="impn:PermitRegNumber">
		<xsl:apply-templates select="*[1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[2]" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[3]"/>
		<xsl:if test="*[4]">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[4]"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="impn:Resident" mode="resolution">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="impn:CertificateNumber">
			<xsl:text>; </xsl:text>
			<xsl:apply-templates select="impn:CertificateNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="impn:Consignor|impn:Consignee|impn:Resident">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text>, </xsl:text>
		<xsl:for-each select="impn:Address">
			<xsl:if test="position() != 1">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text>адрес: </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:text>; </xsl:text>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="impn:CertificateNumber">
			<xsl:text>; </xsl:text>
			<xsl:apply-templates select="impn:CertificateNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="impn:TrustedOrganization">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text>, </xsl:text>
		<xsl:for-each select="impn:Address">
			<xsl:if test="position() != 1">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="." mode="simpleAddress"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="impn:ServiceOrganization">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="not(RUScat_ru:OrganizationName) and RUScat_ru:ShortName">
			<xsl:apply-templates select="RUScat_ru:ShortName"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		<xsl:text>, </xsl:text>
		<xsl:for-each select="RUScat_ru:Address">
			<xsl:if test="position() != 1">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="impn:CertificateNumber">
		<xsl:text> Свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="impn:PreviousDoc">
		<xsl:if test="position() != 1">
			<br/>
		</xsl:if>
		<xsl:apply-templates select="impn:GTDID"/>
		<xsl:if test="impn:GoodsNumeric">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="impn:GoodsNumeric"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="impn:GoodsStatus">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">ЕАЭС</xsl:when>
				<xsl:when test=". = 2">ИНТ</xsl:when>
				<xsl:when test=". = 3">СТЗ</xsl:when>
				<xsl:when test=". = 4">ТРАНЗИТ</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
	</xsl:template>
	<xsl:template match="impn:CombinedCargo">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1 or translate(substring(., 1, 1), 't', 'T') = 'T'">ввоз товаров в составе сборного груза</xsl:when>
				<xsl:otherwise> - </xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="impn:TransportMeans" mode="trailer_numbers">
		<xsl:choose>
			<xsl:when test="impn:TransportRegNumber | impn:EmptyTransportRegNumber">
				<xsl:for-each select="impn:TransportRegNumber | impn:EmptyTransportRegNumber">
					<xsl:if test="position() != 1">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise> - </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="impn:TransportMeans" mode="transport_numbers">
		<xsl:if test="impn:ContainerNumber">
			<xsl:text> Контейнеры: </xsl:text>
			<xsl:for-each select="impn:ContainerNumber">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="impn:ActiveTransportIdentifier">
			<xsl:text> Рег.номер ТС: </xsl:text>
			<xsl:apply-templates select="impn:ActiveTransportIdentifier"/>
		</xsl:if>
		<xsl:if test="impn:TransportRegNumber or impn:EmptyTransportRegNumber">
			<xsl:text> Прицеп: </xsl:text>
			<xsl:for-each select="*[local-name() = 'TransportRegNumber' or local-name() = 'EmptyTransportRegNumber']">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="impn:FlightNumber">
			<xsl:text> Рейс: </xsl:text>
			<xsl:apply-templates select="impn:FlightNumber"/>
		</xsl:if>
		<xsl:if test="impn:FlightDate">
			<xsl:text> Дата рейса: </xsl:text>
			<xsl:apply-templates select="impn:FlightDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="impn:TransportMeans">
		<xsl:apply-templates select="impn:TransportKind"/>
		<xsl:if test="impn:TransportMark">
			<xsl:text>, Марка: </xsl:text>
			<xsl:apply-templates select="impn:TransportMark"/>
		</xsl:if>
		<xsl:if test="impn:TransportModel">
			<xsl:text>, Модель: </xsl:text>
			<xsl:apply-templates select="impn:TransportModel"/>
		</xsl:if>
		<xsl:if test="impn:TrainType">
			<xsl:text>, Тип подвижного ж/д состава: </xsl:text>
			<xsl:apply-templates select="impn:TrainType"/>
		</xsl:if>
		<xsl:if test="impn:PersonDetails">
			<xsl:text>, ФИО: </xsl:text>
			<xsl:for-each select="impn:PersonDetails/*[contains(local-name(), 'ame')]">
				<xsl:if test="position() != 1">
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="impn:PersonID">
			<xsl:text>, Документ, удостоверяющий личность: </xsl:text>
			<xsl:apply-templates select="impn:PersonID" mode="personID"/>
		</xsl:if>
		<xsl:if test="impn:VehicleSign = 3">
			<br/>
			<xsl:text>Порожнее транспортное средство</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*[local-name() = 'TransportKind']">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">а/м</xsl:when>
				<xsl:when test=". = 2">ж/д</xsl:when>
				<xsl:when test=". = 3">авиа</xsl:when>
				<xsl:when test=". = 4">в/т</xsl:when>
				<xsl:when test=". = 5">спецтехника</xsl:when>
				<xsl:when test=". = 6">ручная кладь (багаж)</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="personID">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="NotifNumber">
		<xsl:choose>
			<xsl:when test="impn:DocKind = 2">
				<xsl:apply-templates select="impn:RegistrationNumber" mode="reg_num"/>
			</xsl:when>
			<xsl:when test="$OEZ_NotifReg">
				<xsl:apply-templates select="$OEZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="impn:RegistrationNumber" mode="reg_num"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number']"/>
		<xsl:if test="impn:AddNumber|oeznr:DocKind">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="impn:AddNumber|oeznr:DocKind"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="impn:PreviousDoc/impn:GTDID">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn2"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
				<xsl:value-of select="substring($dateIn2,9,2)"/>
				<xsl:value-of select="substring($dateIn2,6,2)"/>
				<xsl:value-of select="substring($dateIn2,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn2"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="impn:Address | impn:AddressZone | RUScat_ru:SubjectAddressDetails | RUScat_ru:Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<!--xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if-->
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<!--xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when-->
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="not(local-name()='AddressKindCode')">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="impn:ConsignParticipant">
		<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:apply-templates select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<br/>
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<span class="header"> Адрес:</span>
			<br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures | RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span> ИНН: <xsl:apply-templates select="cat_ru:INN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:apply-templates select="cat_ru:KPP"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span> УНП: <xsl:apply-templates select="cat_ru:UNP"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span> Идентификационный номер: <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span> БИН: <xsl:apply-templates select="cat_ru:BIN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span> ИИН: <xsl:apply-templates select="cat_ru:IIN"/>
			</span>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span> ИТН: 
			<xsl:apply-templates select="cat_ru:CategoryCode"/>/<xsl:apply-templates select="cat_ru:KATOCode"/>/<xsl:apply-templates select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:apply-templates select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="simpleAddress" match="*">
		<span class="header"> Адрес:</span>
		<br/>
		<xsl:if test="RUScat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">(<xsl:apply-templates select="RUScat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:City">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<br/>Почтовый индекс: <xsl:apply-templates select="RUScat_ru:PostalCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="header"> Документ, удостоверяющий личность:</span>
		<br/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode">(код вида документа <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
			Серия номер:
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
         <xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="$data"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
