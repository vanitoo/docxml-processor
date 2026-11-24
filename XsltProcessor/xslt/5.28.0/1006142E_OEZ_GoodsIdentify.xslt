<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:gooid="urn:customs.ru:Information:CustomsDocuments:OEZ_GoodsIdentify:5.28.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="gooid:OEZ_GoodsIdentify">
		<xsl:variable name="docSign">
			<xsl:if test="gooid:DocSign = '0'">Уведомление инспектора</xsl:if>
			<xsl:if test="gooid:DocSign = '1'">Заявление декларанта</xsl:if>
			<xsl:if test="gooid:DocSign = '2'">Заявление об идентификации иностранных товаров, помещаемых под процедуру СТЗ, в готовой продукции</xsl:if>
		</xsl:variable>
		<html>
			<head>
				<title>
					<xsl:value-of select="$docSign"/>
				</title>
				<style type="text/css">
					body {
							/*text-align: center;*/
							background: #cccccc;
							}
						div.page {
							width: 267mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .8pt #000000;
							}
						div.page0 {
							width: 200mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .8pt #000000;
							}							
						td {
							font-family:arial;
							
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMainbold {
						font-family: Arial;
						font-size: 10pt;
						font-weight:bold;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: normal;
										}	
					.borderednormal {
					border-bottom: solid 1pt #000000;
					font-weight: normal;
										}	
					.allbordered {
					border-bottom: solid 1pt #000000;
					border-top: solid 1pt #000000;
					border-left: solid 1pt #000000;
					border-right: solid 1pt #000000;
					font-weight: normal;
										}						
                </style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="gooid:DocSign = '0'">
						<div class="page0">
							<table border="0" style="width: 100%">
								<tbody>
									<tr>
										<td align="center" colspan="3" style="width: 100%">
											<b>
												Уведомление о проведении идентификации товаров,<br/>ввозимых (ввезенных) на территорию ОЭЗ
											</b>
											<br/>
											<xsl:apply-templates select="gooid:DateDocument" mode="russian_date_month"/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="width:45%"/>
										<td style="width:10%"/>
										<td style="width:45%"/>
									</tr>
									<tr>
										<td valign="bottom" class="bordered">
											<!--xsl:text>в </xsl:text-->
											<xsl:value-of select="gooid:Customs/cat_ru:OfficeName"/>
										</td>
										<td/>
										<td valign="bottom" class="bordered">
											<!--xsl:text>от </xsl:text-->
											<xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/> 
						<xsl:if test="gooid:OEZ_Resident/RUScat_ru:SubjectAddressDetails">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/RUScat_ru:SubjectAddressDetails">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each> 
						</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif">
												<xsl:text> </xsl:text>
												<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentNumber"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/gooid:FactAddress">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/gooid:FactAddress/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/RUScat_ru:IdentityCard">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="gooid:OEZ_Resident/RUScat_ru:IdentityCard"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center"><!--(наименование таможенного органа)--></td>
										<td/>
										<td class="graphLittle" align="center"><!--(заявитель)--></td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;
											</xsl:text>
											<xsl:text>Настоящим  уведомляем,  что в отношении товаров, ввозимых на территорию ОЭЗ, по уведомлению о ввозе N </xsl:text>
											<span class="bordered" style="display: inline-block; width: 70mm; text-align: center;">
											<xsl:apply-templates select="gooid:RegistrationNumberImp" mode="gtd_number"/>
											</span>
											<xsl:text> уполномоченным   таможенным   органом   принято   решение   о    проведении идентификации товаров</xsl:text>
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
								<tbody>
									<tr align="center">
										<td width="15%">№ п/п</td>
										<td>Наименование товара</td>
									</tr>
									<tr>
										<td align="center">1</td>
										<td align="center">2</td>
									</tr>
									<xsl:for-each select="gooid:MaterialGoods">
										<tr valign="top">
											<td>
												<xsl:apply-templates select="gooid:Position"/>
											</td>
											<td>
												<xsl:apply-templates select="gooid:GoodsDescription"/>
											</td></tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>по следующим причинам:</xsl:text>
										</td>
									</tr>
									<tr>
										<td align="left" class="bordered">
											<xsl:apply-templates select="gooid:Reason"/>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">(указываются причины, по которым принято решение о проведении идентификации товаров)<br/></td>
									</tr>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>Вам необходимо:</xsl:text>
											<br/>
											<xsl:text>1) представить товары и средства транспорта, перевозящие такие товары в зону таможенного контроля</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="bordered">
											<xsl:apply-templates select="gooid:PlaceIdentify"/>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">(указываются причины, по которым принято решение о проведении идентификации товаров)<br/></td>
									</tr>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>2) совершить следующие действия в отношении товаров и средств транспорта, перевозящих такие товары:</xsl:text>
										</td>
									</tr>
									<tr>
										<td align="left">
											<xsl:apply-templates select="gooid:Activity"/>
										</td>
									</tr>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>3) представить в уполномоченный таможенный орган документы и сведения</xsl:text>
										</td>
									</tr>
									<tr>
										<td align="left">
											<xsl:apply-templates select="gooid:PresentInfo"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table style="width:200mm">
								<br/>
								<tbody>
									<tr valign="bottom">
										<td class="bordered" style="width:75mm">
											<xsl:value-of select="gooid:CustomsPerson/cat_ru:PersonName"/>
										</td>
										<td style="width:5mm"/>
										<td class="bordered" style="width:40mm">
											<br/>
										</td>
										<td style="width:5mm;"/>
										<td class="bordered" style="width:75mm;" align="center">
											<xsl:value-of select="gooid:CustomsPerson/cat_ru:LNP"/>
											<xsl:if test="gooid:CustomsPerson/cat_ru:CustomsCode">
												<xsl:text> (код ТО: </xsl:text>
												<xsl:value-of select="gooid:CustomsPerson/cat_ru:CustomsCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<tr align="center">
										<td class="graphLittle">
											(Ф.И.О. должностного лица уполномоченного таможенного органа)
										</td>
										<td/>
										<td class="graphLittle">
											(подпись)
										</td>
										<td/>
										<td class="graphLittle">
											(ЛНП)
										</td>
									</tr>
									<tr>
										<td><br/><br/></td>
									</tr>
									<tr valign="bottom">
										<td class="bordered">
											<xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/>
										</td>
										<td/>
										<td class="bordered">
											<br/>
										</td>
										<td/>
										<td class="bordered" align="center">
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="gooid:DateDocument"/></xsl:call-template>
										</td>
									</tr>
									<tr align="center">
										<td class="graphLittle">
											(Ф.И.О. лица, получившего уведомление)
										</td>
										<td/>
										<td class="graphLittle">
											(подпись)
										</td>
										<td/>
										<td class="graphLittle">
											(дата получения)
										</td>
									</tr>
									<tr>
										<td><br/><br/></td>
									</tr>
									<tr valign="bottom">
										<td class="bordered">
											<xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/>
										</td>
										<td/>
										<td class="bordered" align="center">
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="gooid:DateDocument"/></xsl:call-template>
										</td>
										<td/>
										<td class="bordered">
											<xsl:value-of select="gooid:CustomsPerson/cat_ru:PersonName"/>
										</td>
									</tr>
									<tr align="center" valign="top">
										<td class="graphLittle">
											(Сведения о месте, куда направлено уведомление: Ф.И.О. лица, принявшего уведомление)
										</td>
										<td/>
										<td class="graphLittle">
											(дата направления уведомления)
										</td>
										<td/>
										<td class="graphLittle">
											(Ф.И.О. должностного лица уполномоченного таможенного органа, направившего уведомление)
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="page">
							<table border="0" style="width: 100%">
								<tbody>
									<tr>
										<td align="center" colspan="3" style="width: 100%">
											<b>
												<xsl:value-of select="$docSign"/>
											</b>
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td valign="bottom" class="bordered" style="width:70mm">
											<xsl:text>№ </xsl:text>
											<xsl:choose>
												<xsl:when test="gooid:DocSign='2'">
													<xsl:value-of select="gooid:RegistrationNumber/gooid:Number"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="gooid:RegNumber"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td style="width:120mm"/>
										<td valign="bottom" align="center" class="bordered" style="width:100mm">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="gooid:DateDocument"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">
											<xsl:choose>
												<xsl:when test="gooid:DocSign='2'">(регистрационный номер заявления)</xsl:when>
												<xsl:otherwise>(номер документа)</xsl:otherwise>
											</xsl:choose>
										</td>
										<td/>
										<td class="graphLittle" align="center">(дата подачи заявления)<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td valign="bottom" class="bordered">
											<xsl:text>в </xsl:text>
											<xsl:value-of select="gooid:Customs/cat_ru:OfficeName"/>
										</td>
										<td/>
										<td valign="bottom" class="bordered">
											<xsl:text>от </xsl:text>
											<xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/> 
						<xsl:if test="gooid:OEZ_Resident/RUScat_ru:SubjectAddressDetails">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/RUScat_ru:SubjectAddressDetails">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each> 
						</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif">
												<xsl:text> </xsl:text>
												<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentNumber"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/gooid:FactAddress">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/gooid:FactAddress/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/RUScat_ru:IdentityCard">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="gooid:OEZ_Resident/RUScat_ru:IdentityCard"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="graphLittle" align="center">(наименование таможенного органа)</td>
										<td/>
										<td class="graphLittle" align="center">(заявитель)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>Прошу Вас выдать заключение о возможности идентификации иностранных товаров, помещаемых (помещенных) под таможенную процедуру свободной таможенной зоны, в готовой продукции. Сообщаю следующие сведения:
							<br/>
											<br/>
											<xsl:text>1) готовая продукция:</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
								<tbody>
									<tr>
										<td width="15%" style="border: 0pt;"/>
										<td width="7%" style="border: 0pt;"/>
										<td width="31%" style="border: 0pt;"/>
										<td width="7%" style="border: 0pt;"/>
										<td width="15%" style="border: 0pt;"/>
										<td width="10%" style="border: 0pt;"/>
										<td width="15%" style="border: 0pt;"/>
									</tr>
									<tr>
										<td align="center" colspan="4">Сведения о товарах</td>
										<td align="center" colspan="3">Основания владения, пользования и (или) распоряжения готовой продукцией</td>
									</tr>
									<tr>
										<td align="center">Наименование товара</td>
										<td align="center">Код товара по ТН ВЭД ЕАЭС</td>
										<td align="center">Идентификационные признаки товара</td>
										<td align="center">количество<br/>товара /<br/>единицы<br/>измерения<br/>(основная<br/>и допол-<br/>нительная)</td>
										<td align="center">Наименование лица</td>
										<td align="center">Наименование документа</td>
										<td align="center">Реквизиты документа</td>
									</tr>
									<tr>
										<td align="center">1</td>
										<td align="center">2</td>
										<td align="center">3</td>
										<td align="center">4</td>
										<td align="center">5</td>
										<td align="center">6</td>
										<td align="center">7</td>
									</tr>
									<xsl:for-each select="gooid:ResultGoods">
										<tr valign="top">
											<td>
												<xsl:for-each select="gooid:GoodsDescription">
													<xsl:value-of select="."/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="gooid:DocSign='2'">
														<xsl:value-of select="gooid:GoodsTNVEDCode"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="substring(gooid:GoodsTNVEDCode,1,6)"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td style="word-break: break-all;">
												<xsl:for-each select="gooid:GoodsGroupInformation">
													<xsl:for-each select="*[local-name()='Manufacturer' or local-name()='TradeMark' or local-name()='GoodsMark' or local-name()='GoodsModel' or local-name()='GoodsMarking' or local-name()='GoodsStandard' or local-name()='GoodsSort' or local-name()='WoodDescriptionDetails' or local-name()='Dimensions' or local-name()='DateIssue' or local-name()='SerialNumber' or local-name()='LicenseGroup']">
														<xsl:if test="position()!=1 and local-name()!='SerialNumber'">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
														<xsl:choose>
															<xsl:when test="local-name()='WoodDescriptionDetails'">
																<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
															</xsl:when>
															<xsl:when test="local-name()='DateIssue'">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="."/>
																</xsl:call-template> 
															</xsl:when>
															<xsl:when test="local-name()='Dimensions'">
																<xsl:apply-templates mode="Dimensions" select="."/>
															</xsl:when>
															<xsl:when test="local-name()='SerialNumber' and not(preceding-sibling::*[local-name()='SerialNumber'])">
																<xsl:if test="position()!=1">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:if>
																<!--для unbounted элемента SerialNumber выведем сразу все, как только всетретили первый (это надо, чтобы не делать лишних пробелов между ними)-->
																<xsl:apply-templates select="../*[local-name()='SerialNumber']"/>
																<!--xsl:for-each select="../*[local-name()='SerialNumber']">
																	<xsl:value-of select="."/>
																</xsl:for-each-->
															</xsl:when>
															<xsl:when test="local-name()='LicenseGroup'">
																<xsl:if test="not(preceding-sibling::*[local-name()='LicenseGroup'])">
																	<xsl:if test="position()!=1">
																		<xsl:text>; </xsl:text>
																	</xsl:if>
																	<xsl:if test="position()=1">
																		<xsl:text>Сведения о разрешительном документе к товарной группе: </xsl:text>
																	</xsl:if>
																	<!--для unbounted элемента LicenseGroup выведем сразу все, как только всетретили первый-->
																	<xsl:for-each select="../*[local-name()='LicenseGroup']">
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		<xsl:apply-templates select="catESAD_cu:LicDocument"/>
																		<xsl:if test="catESAD_cu:GoodsNumericLic">
																			<xsl:text> для тов №: </xsl:text>
																			<xsl:value-of select="catESAD_cu:GoodsNumericLic"/>
																		</xsl:if>
																		<xsl:if test="position()!=last()">; </xsl:if>
																	</xsl:for-each>
																</xsl:if>
															</xsl:when>
															<xsl:otherwise>
																<xsl:if test="local-name()!='SerialNumber'">
																	<xsl:apply-templates select="."/>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="gooid:GoodsQuantity">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/cat_ru:OrganizationName"/>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentName"/>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentNumber"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>2) товары, помещаемые (помещенные) под таможенную процедуру свободной таможенной зоны:</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
								<tbody>
									<tr align="center">
										<td width="14%" style="border: 0pt;"/>
										<td width="6%" style="border: 0pt;"/>
										<td width="30%" style="border: 0pt;"/>
										<td width="7%" style="border: 0pt;"/>
										<td width="6%" style="border: 0pt;"/>
										<td width="14%" style="border: 0pt;"/>
										<td width="9%" style="border: 0pt;"/>
										<td width="14%" style="border: 0pt;"/>
									</tr>
									<tr align="center">
										<td colspan="5">Сведения о товарах</td>
										<td colspan="3">Владение, пользование и (или) распоряжение товарами, помещаемыми (помещенными) под таможенную процедуру свободной таможенной зоны, использованными при изготовлении готовой продукции</td>
									</tr>
									<tr align="center" valign="top">
										<td>наименование товара</td>
										<td>код товара</td>
										<td>идентификационные признаки товара</td>
										<td>регистрационный номер ДТ/<br/>порядковый номер(а) товара (регистрационный номер иного документа, подтверждающего статус товара)</td>
										<td>количество товара / единицы измерения (основная и дополнительная) </td>
										<td>наименования лица</td>
										<td>наименование документа</td>
										<td>реквизиты документа</td>
									</tr>
									<tr align="center">
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>5</td>
										<td>6</td>
										<td>7</td>
										<td>8</td>
									</tr>
									<xsl:for-each select="gooid:MaterialGoods">
										<tr valign="top">
											<td>
												<xsl:apply-templates select="gooid:GoodsDescription"/>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="gooid:DocSign='2'">
														<xsl:value-of select="gooid:GoodsTNVEDCode"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="substring(gooid:GoodsTNVEDCode,1,6)"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td style="word-break: break-all;">
												<xsl:for-each select="gooid:GoodsGroupInformation">
													<xsl:for-each select="*[local-name()='Manufacturer' or local-name()='TradeMark' or local-name()='GoodsMark' or local-name()='GoodsModel' or local-name()='GoodsMarking' or local-name()='GoodsStandard' or local-name()='GoodsSort' or local-name()='WoodDescriptionDetails' or local-name()='Dimensions' or local-name()='DateIssue' or local-name()='SerialNumber' or local-name()='LicenseGroup']">
														<xsl:if test="position()!=1 and local-name()!='SerialNumber'">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
														<xsl:choose>
															<xsl:when test="local-name()='WoodDescriptionDetails'">
																<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
															</xsl:when>
															<xsl:when test="local-name()='DateIssue'">
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="."/>
																</xsl:call-template> 
															</xsl:when>
															<xsl:when test="local-name()='Dimensions'">
																<xsl:apply-templates mode="Dimensions" select="."/>
															</xsl:when>
															<xsl:when test="local-name()='SerialNumber' and not(preceding-sibling::*[local-name()='SerialNumber'])">
																<xsl:if test="position()!=1">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:if>
																<!--для unbounted элемента SerialNumber выведем сразу все, как только всетретили первый (это надо, чтобы не делать лишних пробелов между ними)-->
																<xsl:apply-templates select="../*[local-name()='SerialNumber']"/>
																<!--xsl:for-each select="../*[local-name()='SerialNumber']">
																	<xsl:value-of select="."/>
																</xsl:for-each-->
															</xsl:when>
															<xsl:when test="local-name()='LicenseGroup'">
																<xsl:if test="not(preceding-sibling::*[local-name()='LicenseGroup'])">
																	<xsl:if test="position()!=1">
																		<xsl:text>; </xsl:text>
																	</xsl:if>
																	<xsl:if test="position()=1">
																		<xsl:text>Сведения о разрешительном документе к товарной группе: </xsl:text>
																	</xsl:if>
																	<!--для unbounted элемента LicenseGroup выведем сразу все, как только всетретили первый-->
																	<xsl:for-each select="../*[local-name()='LicenseGroup']">
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		<xsl:apply-templates select="catESAD_cu:LicDocument"/>
																		<xsl:if test="catESAD_cu:GoodsNumericLic">
																			<xsl:text> для тов №: </xsl:text>
																			<xsl:value-of select="catESAD_cu:GoodsNumericLic"/>
																		</xsl:if>
																		<xsl:if test="position()!=last()">; </xsl:if>
																	</xsl:for-each>
																</xsl:if>
															</xsl:when>
															<xsl:otherwise>
																<xsl:if test="local-name()!='SerialNumber'">
																	<xsl:apply-templates select="."/>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td>
												<xsl:apply-templates select="gooid:NumberDT"/>
												<xsl:if test="gooid:GoodsNumeric">
													<xsl:text> / </xsl:text>
													<xsl:value-of select="gooid:GoodsNumeric"/>
												</xsl:if>
												<xsl:if test="gooid:StatusDoc">
													<br/>
													<xsl:text>(</xsl:text>
													<xsl:for-each select="gooid:StatusDoc">
														<xsl:for-each select="*">
															<xsl:choose>
																<xsl:when test="contains(local-name(.),'Date')">
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="."/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select="."/>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:if test="position()!=last()">
																<xsl:text> </xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</td>
											<td>
												<xsl:for-each select="gooid:GoodsQuantity">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/cat_ru:OrganizationName"/>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentName"/>
											</td>
											<td>
												<xsl:value-of select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentNumber"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="gooid:Owner/gooid:TransferOwnershipContract/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>3) лицо(а), которое(ые) непосредственно совершало(ли) или будет(ут) совершать операции в отношении иностранных товаров, помещаемых (помещенных) под таможенную процедуру СТЗ, в соответствии с производственным(и) процессом(ами) по изготовлению готовой продукции:</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
								<tbody>
									<tr align="center">
										<td>Наименование лица</td>
										<td>Наименование документа</td>
										<td>Реквизиты документа</td>
										<td>Операция(ии)</td>
									</tr>
									<tr align="center">
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
									</tr>
									<xsl:for-each select="gooid:Manufacturer">
										<tr valign="top">
											<td>
												<xsl:value-of select="cat_ru:OrganizationName"/>
												<xsl:if test="cat_ru:RFOrganizationFeatures">
													<xsl:text> </xsl:text>
													<xsl:for-each select="cat_ru:RFOrganizationFeatures/*">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()">
															<xsl:text> </xsl:text>
														</xsl:if>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="RUScat_ru:SubjectAddressDetails">
													<br/>
													<xsl:text>Адрес(а): </xsl:text>
													<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="gooid:FactAddress">
													<br/>
												</xsl:if>
												<xsl:for-each select="gooid:FactAddress">
													<xsl:text> Фактич. адрес: </xsl:text>
													<xsl:call-template name="Address"/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="gooid:ManufacturerContract">
													<xsl:value-of select="cat_ru:PrDocumentName"/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:for-each select="gooid:ManufacturerContract">
													<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:text> </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
											<td>
												<xsl:apply-templates select="gooid:Operation"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>4) операции, совершаемые в отношении иностранных товаров, помещаемых (помещенных) под таможенную процедуру СТЗ, при изготовлении готовой продукции:</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<table border="1" cellpadding="0" cellspacing="0" style="width:100%">
								<tbody>
									<xsl:for-each select="gooid:Activity">
										<tr>
											<td>
												<xsl:value-of select="."/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>5) способ(ы) идентификации:</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
								<tbody>
									<xsl:for-each select="gooid:MethodIdentify">
										<tr>
											<td>
												<xsl:value-of select="."/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>6) иные сведения, которые заявитель сочтет необходимым указать:</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<table border="1" cellpadding="0" cellspacing="0" style="width:100%">
								<tbody>
									<xsl:for-each select="gooid:OtherInfo">
										<tr>
											<td>
												<xsl:value-of select="."/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table style="width: 100%">
								<tbody>
									<tr>
										<td align="left">
											<br/>
											<xsl:text>7) опись документов, прилагаемых к заявлению:</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
								<tbody>
									<tr>
										<td>
											<pre style="font-family: Arial; font-size: 12pt;">
												<xsl:for-each select="gooid:PresentInfo">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:value-of select="."/>
												</xsl:for-each>
											</pre>
										</td>
									</tr>
								</tbody>
							</table>
							<table style="width:180mm">
								<br/>
								<tbody>
									<tr>
										<td class="bordered" style="width:100mm">
											<xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/>
										</td>
										<td style="width:40mm"/>
										<td class="bordered" style="width:60mm">
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="graphLittle" style="width:100mm">
                              Ф.И.О. уполномоченного лица заявителя
                        </td>
										<td style="width:40mm"/>
										<td class="graphLittle" style="width:60mm">
							Подпись
                        </td>
									</tr>
									<tr>
										<td class="bordered" style="width:100mm">
											<xsl:value-of select="gooid:OEZ_Resident/cat_ru:OrganizationName"/>
											<br/>
											<xsl:if test="gooid:OEZ_Resident/RUScat_ru:SubjectAddressDetails">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/RUScat_ru:SubjectAddressDetails">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each> 
								</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/cat_ru:RFOrganizationFeatures/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif">
												<xsl:text> </xsl:text>
												<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentNumber"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="gooid:OEZ_Resident/gooid:OEZ_ResidentCertif/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/gooid:FactAddress">
												<xsl:text> </xsl:text>
												<xsl:for-each select="gooid:OEZ_Resident/gooid:FactAddress/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="gooid:OEZ_Resident/RUScat_ru:IdentityCard">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="gooid:OEZ_Resident/RUScat_ru:IdentityCard"/>
											</xsl:if>
										</td>
										<td style="width:40mm"/>
										<td class="bordered" style="width:60mm">
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="graphLittle" style="width:100mm">
                              Ф.И.О. лица, действующего по поручению заявителя и от его имени, и реквизиты документа, подтверждающего полномочия такого лица
                        </td>
										<td style="width:40mm"/>
										<td class="graphLittle" style="width:60mm">
							Подпись
                        </td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
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
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
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
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="gooid:NumberDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn2" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="catESAD_cu:GoodsGroupQuantity|gooid:GoodsQuantity">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='WoodSortiment'">
				<xsl:text>Наим.сортимента: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='WoodKind'">
				<xsl:text>Порода древесины: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='ProductSortName'">
				<xsl:text>Наименование сорта:</xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='AllowanceDetails'">
				<xsl:text>Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='DeviationDetails'">
				<xsl:text>Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='catESAD_cu:DiameterRangeDetails'">
				<xsl:text>Диапазон диаметров: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select=".">
					<xsl:with-param name="separator" select="'-'"/>
				</xsl:apply-templates>
			</xsl:if>
			<xsl:if test="local-name()='ContractVolumeMeasure'">
				<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='FactVolumeMeasure'">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType и catESAD_cu:RangeMeasureType-->
	<xsl:template mode="Dimensions" match="*">
		<xsl:param name="separator" select="'x'"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$separator"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_cu:SupplementaryQuantityType и catESAD_cu:UnifiedPhysicalMeasureType-->
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text>
					<xsl:value-of select="."/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="catESAD_cu:LicDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="gtd_number">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number']"/>
	</xsl:template>
	<xsl:template match="*" mode="num_date">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_month">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:variable name="day" select="substring(.,9,2)"/>
				<xsl:variable name="month">
					<xsl:variable name="m" select="substring(.,6,2)"/>
					<xsl:choose>
						<xsl:when test="$m = '01'">января</xsl:when>
						<xsl:when test="$m = '02'">февраля</xsl:when>
						<xsl:when test="$m = '03'">марта</xsl:when>
						<xsl:when test="$m = '04'">апреля</xsl:when>
						<xsl:when test="$m = '05'">мая</xsl:when>
						<xsl:when test="$m = '06'">июня</xsl:when>
						<xsl:when test="$m = '07'">июля</xsl:when>
						<xsl:when test="$m = '08'">августа</xsl:when>
						<xsl:when test="$m = '09'">сентября</xsl:when>
						<xsl:when test="$m = '10'">октября</xsl:when>
						<xsl:when test="$m = '11'">ноября</xsl:when>
						<xsl:when test="$m = '12'">декабря</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$m"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="yearPart1" select="substring(.,1,2)"/>
				<xsl:variable name="yearPart2" select="substring(.,3,2)"/>
				
				<u>
				<xsl:value-of select="$day"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$month"/>
				</u>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$yearPart1"/>
				<u>
				<xsl:value-of select="$yearPart2"/>
				</u>
				<xsl:text>г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
