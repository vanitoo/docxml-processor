<?xml version="1.0" encoding="UTF-8"?>
<!-- "Приказ ФТС России от 25.10.2011 № 2199 "Об утверждении форм документов для целей применения отдельных форм таможенного контроля",  Приложение 2" -->
<!-- Приказ ФТС России от 07.12.2020 № 1067 "Об утверждении форм документов, составляемых таможенными органами при проведении и по результатам проведения отдельных форм таможенного контроля и мер, обеспечивающих проведение таможенного контроля"
DocumentKind=0 - Уведомление о проведении таможенного досмотра (Приложение N 2)
DocumentKind=1 - Требование о предъявлении товаров (Приложение N 3)-->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ntfin="urn:customs.ru:Information:CustomsDocuments:NotifInspectionReqGoods:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:key name="distinctNumbers" use="." match="*"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="DocID">
		<xsl:param name="DocID"/>
		<xsl:choose>
			<xsl:when test="$DocID/ntfin:DTRegNum">
				<xsl:for-each select="$DocID/ntfin:DTRegNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:TDRegNum">
				<xsl:for-each select="$DocID/ntfin:TDRegNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:MPORegNum">
				<xsl:for-each select="$DocID/ntfin:MPORegNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="ntfin:CustomsCode"/>
						<xsl:with-param name="date" select="ntfin:RegistrationDate"/>
						<xsl:with-param name="number" select="ntfin:MPO_Number"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:AppRelNum">
				<xsl:for-each select="$DocID/ntfin:AppRelNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
						<xsl:with-param name="add_number" select="ntfin:AddNumber"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:TIRIdDetails">
				<xsl:for-each select="$DocID/ntfin:TIRIdDetails/*">
					<xsl:if test="position()!=1">
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:DTMDocDetails">
				<xsl:for-each select="$DocID/ntfin:DTMDocDetails">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
						<xsl:with-param name="add_number" select="cat_ru:TransportModeCode"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:PassengerRegNum">
				<xsl:for-each select="$DocID/ntfin:PassengerRegNum">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:TransportPP">
				<xsl:for-each select="$DocID/ntfin:TransportPP">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$DocID/ntfin:ExpressNumber">
				<xsl:for-each select="$DocID/ntfin:ExpressNumber">
					<xsl:call-template name="gdt_number">
						<xsl:with-param name="customsCode" select="cat_ru:CustomsCode"/>
						<xsl:with-param name="date" select="cat_ru:RegistrationDate"/>
						<xsl:with-param name="number" select="cat_ru:GTDNumber"/>
					</xsl:call-template>
					<xsl:if test="ntfin:HouseWaybill">
						<xsl:text>, индивидуальная накладная </xsl:text>
						<xsl:apply-templates select="ntfin:HouseWaybill"/>
					</xsl:if>
					<xsl:if test="ntfin:ObjectOrdinal">
						<xsl:text> № п/п </xsl:text>
						<xsl:apply-templates select="ntfin:ObjectOrdinal"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="gdt_number">
		<xsl:param name="customsCode"/>
		<xsl:param name="date"/>
		<xsl:param name="number"/>
		<xsl:param name="add_number" select="''"/>
		<xsl:if test="$customsCode != ''">
			<xsl:apply-templates select="$customsCode"/>
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:if test="$date != ''">
			<xsl:apply-templates mode="russian_date_gtd" select="$date"/>
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:if test="$add_number != ''">
			<xsl:choose>
				<xsl:when test="$add_number = 'ЗВ'">В</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="$add_number"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:apply-templates select="$number"/>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:PostalCode"/> 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/> 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:apply-templates select="cat_ru:Region"/> 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:apply-templates select="cat_ru:City"/> 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ntfin:NotifInspectionReqGoods">
		<xsl:variable name="form">
			<xsl:choose>
				<xsl:when test="ntfin:FormSign = 'false' or ntfin:FormSign = 'FALSE' or ntfin:FormSign=0">осмотр</xsl:when>
				<xsl:otherwise>досмотр</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Решение о проведении таможенного досмотра.</title>
				<style type="text/css">
					body
					{text-align: center;
					background: #cccccc;}

					div.page
					{width: 210mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left:	10mm;
					background: #ffffff;
					border: solid .5pt #000000;}

					td
					{font-family: Arial;}

					.normal{
					font-weight: bold;
					font-family: Arial;
					font-size: 10pt;
					border-left: medium none;
					border-right: medium none;
					border-top: medium none;
					border-bottom: 1pt solid windowtext;}

					.bold
					{font-weight: bold;
					font-family: Arial;
					font-size: 13pt;}

					.italic{
					font-style: italic; 
					font-family: Arial;
					font-size: 9pt}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					font-weight: bold;}

					.graphMain
					{font-family: Arial;
					font-size: 10pt;
					font-weight: normal;}

					.graphLittle
					{font-family: Arial;
					font-size: 7pt;}

					.graph14Bold
					{font-family: Arial;
					font-size: 14pt;
					font-weight: bold;}

					.delim_3
					{height: 3pt;}

					.bordered
					{border-bottom: solid 1pt #000000;}

					.uplined
					{border-top: solid 1pt #000000;
					font-family: Arial;
					font-size: 7pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align: bottom;}

					.italic
					{font-style: italic;
					font-family: Arial;
					font-size: 11pt;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					.descr
					{font-size: 7.5pt;
					text-align: center;}
					
					.annot
					  {
					  font-family: Arial;
					  font-size: 11pt;
					  }
					.value
					  {
					  border-bottom: solid 1px black;
					  font-family: Arial;
					  font-size: 11pt;
					  font-style: italic;
					  }
					td.graphMain
					  {
					  vertical-align:top;
					  }
					td.value.graphMain
					  {
					  vertical-align:bottom;
					  }
                </style>
			</head>
			<body>
				<div class="page">
					<table style="width:210mm">
						<tbody>
							<tr>
								<td style="width:70mm" valign="top">
									<table style="width:70mm">
										<tbody>
											<tr>
												<td class="bordered">
													<xsl:apply-templates select="ntfin:Customs/cat_ru:Code"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">(указывают код и наименование</td>
											</tr>
											<tr>
												<td class="bordered">
													<xsl:apply-templates select="ntfin:Customs/cat_ru:OfficeName"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">таможенного органа (структурного подразделения)</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="width:40mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								</td>
								<td style="width:100mm" valign="top">
									<table style="width:90mm">
										<tbody>
											<tr>
												<td class="bordered">
													<xsl:choose>
														<xsl:when test="ntfin:Declarant/ntfin:Representative[ntfin:RepPresence = 1 or translate(substring(ntfin:RepPresence, 1, 1), 't', 'T') = 'T']">
															<xsl:apply-templates select="ntfin:Declarant/ntfin:Representative/ntfin:OrganizationName"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="ntfin:Declarant/cat_ru:OrganizationName"/>
														</xsl:otherwise>
													</xsl:choose>
													
												</td>
											</tr>
											<tr>
												<td class="graphLittle">(наименование юридического лица,</td>
											</tr>
											<tr>
												<td class="bordered">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">фамилия, имя, отчество (при наличии)</td>
											</tr>
											<tr>
												<td class="bordered">
													<!--xsl:if test="ntfin:Declarant/ntfin:Representative">
														<xsl:apply-templates select="ntfin:Declarant/ntfin:Representative/ntfin:OrganizationName"/>
													</xsl:if-->
												</td>
											</tr>
											<tr>
												<td class="graphLittle">индивидуального предпринимателя или физического лица, являющегося</td>
											</tr>
											<tr>
												<td class="bordered">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">декларантом или иным лицом, обладающим полномочиями в отношении товаров)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<xsl:if test="ntfin:DocumentKind='0' or ntfin:DocumentKind='7'">
								<tr>
									<td>
										<br/>
										<br/>
										<span class="graph14Bold">УВЕДОМЛЕНИЕ</span>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<b>о проведении таможенного <xsl:value-of select="$form"/>а</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										от <span class="bordered">
											<xsl:apply-templates mode="russian_date" select="ntfin:NotifReqDate"/>
										</span> 
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify">
										<xsl:choose>
											<xsl:when test="$form='осмотр'">
												<xsl:text>  В соответствии с пунктом 3 статьи 327 Таможенного кодекса Евразийского экономического союза уведомляем, что в ходе таможенного контроля в отношении товаров</xsl:text>
											</xsl:when>
											<xsl:when test="$form!='осмотр'">
												<xsl:text>  В соответствии с пунктом 3 статьи 328 Таможенного кодекса Евразийского экономического союза уведомляем, что в ходе таможенного контроля в отношении товаров</xsl:text>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td style="text-align: justify; word-break: break-all;" class="bordered">
										<xsl:for-each select="ntfin:Goods">
											<xsl:apply-templates select="ntfin:GoodsNumber"/>
											<xsl:if test="ntfin:GoodsDescription"> - <xsl:apply-templates select="ntfin:GoodsDescription"/>
											</xsl:if>
											<xsl:if test="position()!=last()">,</xsl:if>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graphLittle">(указываются номера товаров по таможенной декларации либо краткое их описание)</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td style="text-align: justify" width="65%">
														<xsl:text>сведения о которых содержатся в </xsl:text>
														<xsl:choose>
															<xsl:when test="ntfin:DocumentKind='0'">таможенной декларации </xsl:when>
															<xsl:when test="ntfin:DocumentKind='7'">заявлении о выпуске до подачи ДТ </xsl:when>
														</xsl:choose>
													</td>
													<td width="35%" align="center" valign="bottom" class="bordered">
														<xsl:call-template name="DocID">
															<xsl:with-param name="DocID" select="ntfin:DocID"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td width="20%" style="text-align: justify">
														<xsl:text>в иных документах </xsl:text>
													</td>
													<td width="80%" style="text-align: justify" class="bordered">
														<xsl:for-each select="ntfin:InspDocuments">
															<xsl:apply-templates mode="doc_base" select="."/>
															<xsl:if test="position()!=last()">, </xsl:if>
															<br/>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td style="text-align: justify">принято решение о проведении таможенного <xsl:value-of select="$form"/>а.</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td align="left" width="60%">
														<xsl:text>Таможенный </xsl:text>
														<xsl:value-of select="$form"/>
														<xsl:text> товаров будет проведен:</xsl:text>
													</td>
													<td width="40%" align="center" class="bordered">
														<xsl:apply-templates mode="russian_time" select="ntfin:InspTime"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates mode="russian_date" select="ntfin:InspDate"/>
													</td>
												</tr>
												<tr>
													<td/>
													<td class="graphLittle">(время, дата)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td style="text-align: justify" class="bordered">
										<xsl:for-each select="ntfin:InspectionPlace">
											<xsl:if test="ntfin:InformationTypeCode">
												<xsl:choose>
													<xsl:when test="ntfin:InformationTypeCode=11">СВХ</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=21">ТС</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=25">Свободный склад</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=31">Склад получателя</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=41">Склад хранения собственных товаров</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=52">ТС</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=60">Помещение(площадки) УЭО</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=72">ЗТК</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=80">ОЭЗ</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=91">Адрес места хранения</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=99">Иное место ВХ</xsl:when>
												</xsl:choose>
												<!--xsl:value-of select="ntfin:InspectionPlace/ntfin:InformationTypeCode"/-->  
											</xsl:if>
											<xsl:apply-templates select="ntfin:InspPlaceName"/> 
											<xsl:if test="cat_ru:OfficeName">
												<xsl:apply-templates select="cat_ru:OfficeName"/>
												<xsl:if test="cat_ru:Code"> (<xsl:apply-templates select="cat_ru:Code"/>)</xsl:if> 
											</xsl:if>
											<xsl:if test="ntfin:InspPlaceDesc">
												<xsl:for-each select="ntfin:InspPlaceDesc">
													<xsl:apply-templates select="."/> 
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="ntfin:WarehousePlace">
												<xsl:choose>
													<xsl:when test="ntfin:DocumentModeCode='1'"> лицензия </xsl:when>
													<xsl:when test="ntfin:DocumentModeCode='2'"> свидетельство</xsl:when>
												</xsl:choose>
												<xsl:apply-templates select="ntfin:WarehousePlace/cat_ru:PrDocumentName"/> 
												№ <xsl:apply-templates select="ntfin:WarehousePlace/cat_ru:PrDocumentNumber"/> 
												 от <xsl:apply-templates mode="russian_date" select="ntfin:WarehousePlace/cat_ru:PrDocumentDate"/>
											</xsl:if>
											<xsl:if test="ntfin:InspAddress">, адрес: <xsl:for-each select="ntfin:InspAddress">
													<xsl:call-template name="Address"/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="position()!=last()">, </xsl:if>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graphLittle">(указывается место проведения таможенного досмотра в соответствии с классификатором мест нахождения товаров, почтовый адрес места нахождения без почтового индекса, наименование железнодорожной станции (если место нахождения товаров расположено на территории железнодорожной станции (подъездных путях), наименование морского (речного) порта (если место нахождения товаров расположено на территории морского (речного) порта), номер свидетельства о включении в реестр владельцев складов временного хранения (таможенных складов, свободных складов, магазинов беспошлинной торговли, уполномоченных экономических операторов) либо номер разрешения на временное хранение товаров в месте временного хранения, указанном в части 1 статьи 90 Федерального закона от 3 августа 2018 г. N 289-ФЗ, либо номер приказа
таможенного органа о создании зоны таможенного контроля)</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td style="text-align: justify" width="20%">
														<xsl:text>В отношении</xsl:text>
													</td>
													<td width="80%" align="left" class="bordered">
														<xsl:for-each select="ntfin:IdentificationGoods">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">,</xsl:if>
														</xsl:for-each>
														<xsl:if test="ntfin:PakageQuantity">
															<xsl:if test="ntfin:IdentificationGoods">; </xsl:if>общее количество грузовых мест: <xsl:apply-templates select="ntfin:PakageQuantity"/>
														</xsl:if>
														<xsl:if test="ntfin:GrossWeightQuantity">
															<xsl:text>; общий вес товаров брутто (кг): </xsl:text>
															<xsl:apply-templates select="ntfin:GrossWeightQuantity"/>
														</xsl:if>
													</td>
												</tr>
												<xsl:if test="ntfin:Goods/ntfin:TransportMeans">
													<tr>
														<td style="text-align: justify" width="20%"></td>
														<td width="80%" align="left" class="bordered">
															<xsl:text>рег. номер(а) ТС: </xsl:text>
															<xsl:for-each select="ntfin:Goods/ntfin:TransportMeans/ntfin:TransportIdentifier[generate-id() = generate-id(key('distinctNumbers', .)[1])]">
																<xsl:if test="position() != 1">, </xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="ntfin:Goods/ntfin:InspContainer">
													<tr>
														<td style="text-align: justify" width="20%"></td>
														<td width="80%" align="left" class="bordered">
															<xsl:text>рег. номер(а) контейнера(ов): </xsl:text>
															<xsl:for-each select="ntfin:Goods/ntfin:InspContainer/ntfin:ContainerIdentificaror[generate-id() = generate-id(key('distinctNumbers', .)[1])]">
																<xsl:if test="position() != 1">, </xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
												<tr>
													<td/>
													<td class="graphLittle">(указывается наименование товаров, их вес и количество грузовых мест, регистрационные номера транспортных средств, контейнеров)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
							</xsl:if>
							<xsl:if test="ntfin:DocumentKind='1' or ntfin:DocumentKind='8' or ntfin:DocumentKind='9' or ntfin:DocumentKind='10'">
								<tr>
									<td>
										<br/>
										<br/>
										<span class="graph14Bold">ТРЕБОВАНИЕ</span>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<b>о предъявлении товаров</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										от <span class="bordered">
											<xsl:apply-templates mode="russian_date" select="ntfin:NotifReqDate"/>
										</span> 
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify">
										<xsl:text>В целях обеспечения реализации пункта 12 статьи 310 Таможенного кодекса Евразийского экономического союза для осуществления таможенного контроля в форме </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:text>таможенного </xsl:text>
												<xsl:value-of select="$form"/>
												<xsl:text>а</xsl:text>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(указывается форма таможенного контроля)'"/>
											<xsl:with-param name="width" select="'70mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>требуется предъявление в зону таможенного контроля</xsl:text>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td style="text-align: justify" class="bordered">
										<xsl:for-each select="ntfin:InspectionPlace">
											<xsl:if test="ntfin:InformationTypeCode">
												<xsl:choose>
													<xsl:when test="ntfin:InformationTypeCode=11">СВХ</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=21">ТС</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=25">Свободный склад</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=31">Склад получателя</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=41">Склад хранения собственных товаров</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=52">ТС</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=60">Помещение(площадки) УЭО</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=72">ЗТК</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=80">ОЭЗ</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=91">Адрес места хранения</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=99">Иное место ВХ</xsl:when>
												</xsl:choose>
												<!--xsl:value-of select="ntfin:InspectionPlace/ntfin:InformationTypeCode"/-->  
											</xsl:if>
											<xsl:apply-templates select="ntfin:InspPlaceName"/> 
											<xsl:if test="cat_ru:OfficeName">
												<xsl:apply-templates select="cat_ru:OfficeName"/>
												<xsl:if test="cat_ru:Code"> (<xsl:apply-templates select="cat_ru:Code"/>)</xsl:if> 
											</xsl:if>
											<xsl:if test="ntfin:InspPlaceDesc">
												<xsl:for-each select="ntfin:InspPlaceDesc">
													<xsl:apply-templates select="."/> 
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="ntfin:WarehousePlace">
												<xsl:choose>
													<xsl:when test="ntfin:DocumentModeCode='1'"> лицензия </xsl:when>
													<xsl:when test="ntfin:DocumentModeCode='2'"> свидетельство</xsl:when>
												</xsl:choose>
												<xsl:apply-templates select="ntfin:WarehousePlace/cat_ru:PrDocumentName"/> 
												№ <xsl:apply-templates select="ntfin:WarehousePlace/cat_ru:PrDocumentNumber"/> 
												 от <xsl:apply-templates mode="russian_date" select="ntfin:WarehousePlace/cat_ru:PrDocumentDate"/>
											</xsl:if>
											<xsl:if test="ntfin:InspAddress">, адрес: <xsl:for-each select="ntfin:InspAddress">
													<xsl:call-template name="Address"/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="position()!=last()">, </xsl:if>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graphLittle">(указывается место проведения таможенного досмотра в соответствии с классификатором мест нахождения товаров, почтовый адрес места нахождения без почтового индекса, наименование
железнодорожной станции (если место нахождения товаров расположено на территории железнодорожной станции (подъездных путях), наименование морского (речного) порта (если место
нахождения товаров расположено на территории морского (речного) порта), номер свидетельства о включении в реестр владельцев складов временного хранения (таможенных складов, свободных
складов, магазинов беспошлинной торговли, уполномоченных экономических операторов) либо номер разрешения на временное хранение товаров в месте временного хранения, указанном в
части 1 статьи 90 Федерального закона от 3 августа 2018 г. N 289-ФЗ, либо номер приказа таможенного органа о создании зоны таможенного контроля)</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td style="text-align: justify" width="20%" valign="top">
														<xsl:text>товаров</xsl:text>
													</td>
													<td width="80%" class="bordered" style="text-align: justify; word-break: break-all;">
														<xsl:for-each select="ntfin:Goods">
															<xsl:apply-templates select="ntfin:GoodsNumber"/>
															<xsl:if test="ntfin:GoodsDescription"> - <xsl:apply-templates select="ntfin:GoodsDescription"/>
															</xsl:if>
															<xsl:if test="position()!=last()">, </xsl:if>
															<xsl:if test="position()=last()">; </xsl:if>
														</xsl:for-each>
														<xsl:for-each select="ntfin:IdentificationGoods">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">,</xsl:if>
														</xsl:for-each>
													</td>
												</tr>
												<xsl:if test="ntfin:Goods/ntfin:TransportMeans">
													<tr>
														<td style="text-align: justify" width="20%"></td>
														<td width="80%" align="left" class="bordered">
															<xsl:text>рег. номер(а) ТС: </xsl:text>
															<xsl:for-each select="ntfin:Goods/ntfin:TransportMeans/ntfin:TransportIdentifier[generate-id() = generate-id(key('distinctNumbers', .)[1])]">
																<xsl:if test="position() != 1">, </xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="ntfin:Goods/ntfin:InspContainer">
													<tr>
														<td style="text-align: justify" width="20%"></td>
														<td width="80%" align="left" class="bordered">
															<xsl:text>рег. номер(а) контейнера(ов): </xsl:text>
															<xsl:for-each select="ntfin:Goods/ntfin:InspContainer/ntfin:ContainerIdentificaror[generate-id() = generate-id(key('distinctNumbers', .)[1])]">
																<xsl:if test="position() != 1">, </xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
												<tr>
													<td/>
													<td class="graphLittle">(указываются номера товаров по таможенной декларации либо краткое их описание, регистрационные номера транспортных средств, контейнеров)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td style="text-align: justify" width="65%">
														<xsl:text>сведения о которых содержатся в </xsl:text>
														<xsl:choose>
															<xsl:when test="ntfin:DocumentKind='1'">таможенной декларации </xsl:when>
															<xsl:when test="ntfin:DocumentKind='8'">заявлении о выпуске до подачи ДТ </xsl:when>
														</xsl:choose>
													</td>
													<td width="35%" align="center" valign="bottom" class="bordered">
														<xsl:call-template name="DocID">
															<xsl:with-param name="DocID" select="ntfin:DocID"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td width="30%" style="text-align: justify" valign="top">
														<xsl:text>в иных документах </xsl:text>
													</td>
													<td width="70%" style="text-align: justify" class="bordered">
														<xsl:for-each select="ntfin:InspDocuments">
															<xsl:apply-templates mode="doc_base" select="."/>
															<xsl:if test="position()!=last()">, </xsl:if>
															<br/>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td align="left" width="30%">
														<xsl:text>в срок до: </xsl:text>
													</td>
													<td width="70%" align="center" class="bordered">
														<xsl:apply-templates mode="russian_time" select="ntfin:InspTime"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates mode="russian_date" select="ntfin:InspDate"/>
													</td>
												</tr>
												<tr>
													<td/>
													<td class="graphLittle">(время, дата)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
										<br/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ntfin:DocumentKind='2'">
								<tr>
									<td>
										<br/>
										<br/>
										<span class="graph14Bold">УВЕДОМЛЕНИЕ</span>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<b>о необходимости предъявления МПО в ТО</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										от <span class="bordered">
											<xsl:apply-templates mode="russian_date" select="ntfin:NotifReqDate"/>
										</span> 
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="left">  МПО №
										<span class="bordered">
											<xsl:call-template name="DocID">
												<xsl:with-param name="DocID" select="ntfin:DocID"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ntfin:DocumentKind='3'">
								<tr>
									<td>
										<br/>
										<br/>
										<span class="graph14Bold">ТРЕБОВАНИЕ</span>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<b>о предъявлении товаров к осмотру в МПО</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										от <span class="bordered">
											<xsl:apply-templates mode="russian_date" select="ntfin:NotifReqDate"/>
										</span> 
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="left">  МПО №
										<span class="bordered">
											<xsl:call-template name="DocID">
												<xsl:with-param name="DocID" select="ntfin:DocID"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ntfin:DocumentKind='4'">
								<tr>
									<td>
										<br/>
										<br/>
										<span class="graph14Bold">ТРЕБОВАНИЕ</span>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<b>о предъявлении товаров к <xsl:value-of select="$form"/>у МПО</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										от <span class="bordered">
											<xsl:apply-templates mode="russian_date" select="ntfin:NotifReqDate"/>
										</span> 
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="left">  МПО №
										<span class="bordered">
											<xsl:call-template name="DocID">
												<xsl:with-param name="DocID" select="ntfin:DocID"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ntfin:DocumentKind='5'">
								<tr>
									<td>
										<br/>
										<br/>
										<span class="graph14Bold">УВЕДОМЛЕНИЕ</span>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<b>о переносе сроков <xsl:value-of select="$form"/>а</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										от <span class="bordered">
											<xsl:apply-templates mode="russian_date" select="ntfin:NotifReqDate"/>
										</span> 
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<xsl:choose>
											<xsl:when test="ntfin:DocID/ntfin:DTRegNum">ДТ №: </xsl:when>
											<xsl:when test="ntfin:DocID/ntfin:MPORegNum">МПО №: </xsl:when>
											<xsl:when test="ntfin:DocID/ntfin:AppRelNum">Заявление о выпуске до подачи: </xsl:when>
											<xsl:when test="ntfin:DocID/ntfin:ExpressNumber">Реестр экспресс-грузов: </xsl:when>
										</xsl:choose>
										<span class="bordered">
											<xsl:call-template name="DocID">
												<xsl:with-param name="DocID" select="ntfin:DocID"/>
											</xsl:call-template>
										</span>
										<xsl:text>.</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ntfin:DocumentKind='6'">
								<tr>
									<td>
										<br/>
										<br/>
										<span class="graph14Bold">УВЕДОМЛЕНИЕ</span>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<b>о необходимости взятия проб и образцов</b>
										<br/>
										<br/>
									</td>
								</tr>
								<!--tr>
									<td>
										от <span class="bordered">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ntfin:NotifReqDate"/>
										</xsl:call-template>
										</span> 
										<br/>
										<br/>
									</td>
								</tr-->
								<tr>
									<td align="left">
										<xsl:choose>
											<xsl:when test="ntfin:DocID/ntfin:DTRegNum">ДТ №: </xsl:when>
											<xsl:when test="ntfin:DocID/ntfin:MPORegNum">МПО №: </xsl:when>
											<xsl:when test="ntfin:DocID/ntfin:AppRelNum">Заявление о выпуске до подачи: </xsl:when>
											<xsl:when test="ntfin:DocID/ntfin:ExpressNumber">Реестр экспресс-грузов: </xsl:when>
										</xsl:choose>
										<span class="bordered">
											<xsl:call-template name="DocID">
												<xsl:with-param name="DocID" select="ntfin:DocID"/>
											</xsl:call-template>
										</span>
										<xsl:text>.</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="not(ntfin:DocumentKind='0' or ntfin:DocumentKind='1'or ntfin:DocumentKind='7' or ntfin:DocumentKind='8' or ntfin:DocumentKind='9' or ntfin:DocumentKind='10')">
								<tr>
									<td>
										<table align="left" cellpadding="0" style="width:210mm">
											<tbody>
												<tr>
													<td align="left" style="width:150mm">
														<xsl:if test="ntfin:DocumentKind='0' or ntfin:DocumentKind='1' or ntfin:DocumentKind='5' or ntfin:DocumentKind='7' or ntfin:DocumentKind='8' or ntfin:DocumentKind='9' or ntfin:DocumentKind='10'">
															Таможенный <xsl:value-of select="$form"/> товаров и (или) транспортных средств состоится:
														</xsl:if>
														<xsl:if test="ntfin:DocumentKind='2' or ntfin:DocumentKind='3' or ntfin:DocumentKind='4' or ntfin:DocumentKind='6'">
															Взятие проб и образцов товаров и (или) транспортных средств состоится:
														</xsl:if>
													</td>
													<td style="width:20mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="bordered" style="width:40mm">
														<xsl:apply-templates mode="russian_time" select="ntfin:InspTime"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates mode="russian_date" select="ntfin:InspDate"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right" class="graphLittle"> (время, дата)<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>     </td>
								</tr>
								<tr>
									<td class="bordered">
										<xsl:for-each select="ntfin:InspectionPlace">
											<xsl:if test="ntfin:InformationTypeCode">
												<xsl:choose>
													<xsl:when test="ntfin:InformationTypeCode=11">СВХ</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=21">ТС</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=25">Свободный склад</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=31">Склад получателя</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=41">Склад хранения собственных товаров</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=52">ТС</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=60">Помещение(площадки) УЭО</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=72">ЗТК</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=80">ОЭЗ</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=91">Адрес места хранения</xsl:when>
													<xsl:when test="ntfin:InformationTypeCode=99">Иное место ВХ</xsl:when>
												</xsl:choose>
												<!--xsl:value-of select="ntfin:InspectionPlace/ntfin:InformationTypeCode"/-->  
											</xsl:if>
											<xsl:apply-templates select="ntfin:InspPlaceName"/> 
											<xsl:if test="cat_ru:Code">
												<xsl:apply-templates select="cat_ru:Code"/> 
											</xsl:if>
											<xsl:if test="cat_ru:OfficeName">
												<xsl:apply-templates select="cat_ru:OfficeName"/> 
											</xsl:if>
											<xsl:if test="ntfin:InspPlaceDesc">
												<xsl:for-each select="ntfin:InspPlaceDesc">
													<xsl:apply-templates select="."/> 
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="ntfin:WarehousePlace">
												<xsl:apply-templates select="ntfin:WarehousePlace/cat_ru:PrDocumentName"/> 
												№ <xsl:apply-templates select="ntfin:WarehousePlace/cat_ru:PrDocumentNumber"/> 
												 от <xsl:apply-templates mode="russian_date" select="ntfin:WarehousePlace/cat_ru:PrDocumentDate"/>
											</xsl:if>
											<xsl:if test="ntfin:InspAddress">
												<xsl:for-each select="ntfin:InspAddress">
													<xsl:call-template name="Address"/> 
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graphLittle"> 
									(указывается место проведения взятия проб и образцов, адрес зоны таможенного контроля, сведения о складе временного хранения и т.п.)
								</td>
								</tr>
								<xsl:if test="ntfin:IdentificationGoods">
									<tr>
										<td align="left">
											<table>
												<xsl:if test="ntfin:Goods/ntfin:TransportMeans">
													<tr>
														<td style="text-align: justify" width="20%"></td>
														<td width="80%" align="left" class="bordered">
															<xsl:text>рег. номер(а) ТС: </xsl:text>
															<xsl:for-each select="ntfin:Goods/ntfin:TransportMeans/ntfin:TransportIdentifier[generate-id() = generate-id(key('distinctNumbers', .)[1])]">
																<xsl:if test="position() != 1">, </xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="ntfin:Goods/ntfin:InspContainer">
													<tr>
														<td style="text-align: justify" width="20%"></td>
														<td width="80%" align="left" class="bordered">
															<xsl:text>рег. номер(а) контейнера(ов): </xsl:text>
															<xsl:for-each select="ntfin:Goods/ntfin:InspContainer/ntfin:ContainerIdentificaror[generate-id() = generate-id(key('distinctNumbers', .)[1])]">
																<xsl:if test="position() != 1">, </xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
												<xsl:for-each select="ntfin:IdentificationGoods">
													<tr>
														<xsl:if test="position()=1">
															<td align="left" style="width:30mm">в отношении</td>
														</xsl:if>
														<xsl:if test="position() &gt; 1">
															<td align="left" style="width:30mm"/>
														</xsl:if>
														<td class="bordered" style="width:180mm">
															<xsl:apply-templates select="."/>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</td>
									</tr>
									<tr>
										<td class="graphLittle">(указываются номера транспортных средств, контейнеров, товаро-транспортная накладная и прочая информация, идентифицирующая товары)</td>
									</tr>
								</xsl:if>
								<xsl:if test="ntfin:DecisionNumber">
									<tr>
										<td align="left">
											<xsl:text>На основании Решения о проведении таможенной экспертизы № </xsl:text>
											<xsl:for-each select="ntfin:DecisionNumber">
												<xsl:apply-templates select="cat_ru:CustomsCode"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="ntfin:ExpertisePoint"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="cat_ru:SerialNumber"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="not(ntfin:DocumentKind='1' and $form='осмотр')">
									<xsl:if test="ntfin:ActThievingComment">
										<tr>
											<td align="left">
												<xsl:text>Комментарии к отбору проб и образцов: </xsl:text>
												<xsl:apply-templates select="ntfin:ActThievingComment"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:if>
							</xsl:if>
							<xsl:if test="not(ntfin:DocumentKind='1' or ntfin:DocumentKind='8')">
								<tr>
									<td align="left">
										<br/>
										Присутствие при таможенном <xsl:value-of select="$form"/>е: 
										<span class="bordered">
											<xsl:variable name="declPresence" select="ntfin:Declarant/ntfin:Presence"/>
											<xsl:variable name="repPresence" select="ntfin:Declarant/ntfin:Representative/ntfin:RepPresence"/>
											<xsl:choose>
												<xsl:when test="(($declPresence = '1') or translate(substring($declPresence, 1, 1), 't', 'T') = 'T') or (($repPresence = '1') or translate(substring($repPresence, 1, 1), 't', 'T') = 'T')">[Х] требуется   [ ] не требуется</xsl:when>
												<xsl:otherwise>[ ] требуется   [Х] не требуется</xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>(выбрать знаком Х одно из значений) </td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table align="left" style="width:210mm">
										<tbody>
											<tr>
												<td class="bordered" style="width:100mm">
													<xsl:apply-templates select="ntfin:CustomsPerson/cat_ru:PersonName"/>
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="bordered" style="width:40mm">
													<xsl:apply-templates mode="russian_date" select="ntfin:NotifReqDate"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates mode="russian_time" select="ntfin:NotifReqTime"/>
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="bordered" style="width:40mm">
													<!--xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonSurname"/> 
													<xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName,1,1)"/> 
													<xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName,1,1)"/-->
													<xsl:apply-templates select="ntfin:CustomsPerson/cat_ru:LNP"/>
													<xsl:if test="ntfin:CustomsPerson/cat_ru:CustomsCode">
														<xsl:text> (код ТО: </xsl:text>
														<xsl:apply-templates select="ntfin:CustomsPerson/cat_ru:CustomsCode"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" style="width:100mm" valign="top">(инициалы и фамилия уполномоченного должностного лица таможенного органа)</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="graphLittle" valign="top" style="width:40mm">(дата и время направления уведомления)</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="graphLittle" valign="top" style="width:20mm">(подпись)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table align="left" style="width:210mm">
										<tbody>
											<tr>
												<td class="bordered" style="width:100mm">
													<xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<!--xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName"/> 
													<xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName"/-->
													<xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName,1,1)"/>
													<xsl:if test="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName">
														<xsl:text>.</xsl:text>
													</xsl:if>
													<xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName,1,1)"/>
													<xsl:if test="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName">
														<xsl:text>.</xsl:text>
													</xsl:if>
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="bordered" style="width:40mm">
													<br/>
													<!--xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:IssueDate"/>
                                       </xsl:call-template-->
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="bordered" style="width:40mm">
													<!--xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonSurname"/> 
													<xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonName,1,1)"/> 
													<xsl:value-of select="substring(ntfin:DirectionNotifReq/ntfin:Person/cat_ru:PersonMiddleName,1,1)"/--> 
												</td>
											</tr>
											<tr>
												<td class="graphLittle" style="width:100mm">
													(инициалы и фамилия лица, получившего уведомление)
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="graphLittle" style="width:40mm">
													(дата получения уведомления)
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="graphLittle" style="width:20mm">
													(подпись)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left">
									<xsl:choose>
										<xsl:when test="ntfin:DocumentKind='0' or ntfin:DocumentKind='2' or ntfin:DocumentKind='5' or ntfin:DocumentKind='6' or ntfin:DocumentKind='7'">При направлении уведомления по почте или иным способом:</xsl:when>
										<xsl:otherwise>При направлении требования по почте или иным способом:</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td>
									<table align="left" style="width:210mm">
										<tbody>
											<tr>
												<td style="width:100mm">
													<xsl:if test="ntfin:DirectionNotifReq">
														<xsl:for-each select="ntfin:DirectionNotifReq/ntfin:Address">
															<xsl:call-template name="Address"/> 
														</xsl:for-each>
														<xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:MethodDirection"/>
													</xsl:if>
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td style="width:20mm">
													<xsl:apply-templates mode="russian_date" select="ntfin:DirectionNotifReq/ntfin:DateDirection"/>
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td style="width:40mm">
													<xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:CustomsPerson/cat_ru:PersonName"/>
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:CustomsPerson/cat_ru:LNP"/>
													<xsl:if test="ntfin:DirectionNotifReq/ntfin:CustomsPerson/cat_ru:CustomsCode">
														<xsl:text> (код ТО: </xsl:text>
														<xsl:apply-templates select="ntfin:DirectionNotifReq/ntfin:CustomsPerson/cat_ru:CustomsCode"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="uplined" style="width:100mm" valign="top">(сведения о месте, куда направлено уведомление, и способе его направления)</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="uplined" style="width:20mm">
													(дата направления уведомления)
												</td>
												<td style="width:10mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="uplined" style="width:40mm">
													(инициалы, фамилия и подпись должностного лица таможенного органа, направившего уведомление)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<xsl:if test="ntfin:ChangeSign or ntfin:ChangeComment or ntfin:PrevCustoms">
					<div class="page">
						<div class="graph14Bold">Дополнительные сведения</div>
						<br/>
						<br/>
						<xsl:if test="ntfin:ChangeSign">
							<table width="100%" style="text-align: left;">
								<tr>
									<td class="annot graphMain" style="width:40%">Признак необходимости перемещения<br/>товаров в иную ЗТК</td>
									<td class="value graphMain" style="width:60%">
										<xsl:choose>
											<xsl:when test="ntfin:ChangeSign=1 or translate(substring(ntfin:ChangeSign, 1, 1), 't', 'T') = 'T'">есть</xsl:when>
											<xsl:otherwise>нет</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</table>
						</xsl:if>
						<xsl:if test="ntfin:ChangeComment">
							<table width="100%" style="text-align: left;">
								<tr>
									<td class="annot graphMain" style="width:40%">Причины необходимости перемещения<br/>товаров в иную ЗТК</td>
									<td class="value graphMain" style="width:60%">
										<xsl:apply-templates select="ntfin:ChangeComment"/>
									</td>
								</tr>
							</table>
						</xsl:if>
						<xsl:if test="ntfin:PrevCustoms">
							<table width="100%" style="text-align: left;">
								<tr>
									<td class="annot graphMain" style="width:40%">Код ТО в регионе деятельности которого ЗТК, назначенный ранее</td>
									<td class="value graphMain" style="width:60%">
										<xsl:apply-templates select="ntfin:PrevCustoms"/>
									</td>
								</tr>
							</table>
						</xsl:if>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="doc_base">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №  </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="RUScat_ru:DocKindCode"> (<xsl:apply-templates select="RUScat_ru:DocKindCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 5)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='NotifInspectionReqGoods']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
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
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
