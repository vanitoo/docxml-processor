<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ Минфина России № 18н от 28 февраля 2024 года «Об утверждении формы разрешения на ввоз товаров на территорию портовой особой экономической зоны, на земельный участок, прилегающий к автомобильному или  железнодорожному пункту пропуска свободного порта Владивосток, арктической зоны Российской Федерации, на котором применяется таможенная процедура свободной таможенной зоны, установленная для логистической особой экономической зоны, на отдельные участки морских портов, открытых для международного сообщения и захода иностранных морских судов, включая акваторию морского порта, и (или) на отдельные участки территории аэропорта, открытого для приема и отправки воздушных судов, выполняющих международные воздушные перевозки, находящиеся на территории свободного порта Владивосток, в Арктической зоне Российской Федерации, на участки территории свободного порта Республики Крым и города Федерального значения Севастополя, на которых применяется таможенная процедура свободной таможенной зоны, установленная для портовой особой экономической зоны, а также порядка заполнения указанной формы разрешения» -->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:impas="urn:customs.ru:Information:CustomsDocuments:OEZ_ImportPass:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="impas:OEZ_ImportPass">
		<html>
			<head>
				<title>Пропуск на выезд средства транспорта с территории ОЭЗ</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier New;
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
					font-weight: bold;
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
					 td.graphUnderline {
                    border-bottom: 1px solid black;
                    text-align: center;
                    font-weight: normal;
                    font-size: 9pt; 
                    }
                                       
                    td.graphNotUnderline {
                    border-bottom: 0px solid black;
                    text-align: center;
                    font-weight: normal; 
                    }
                    
                </style>
			</head>
			<body>
				<div class="page">
					<table border="0" style="width:297mm">
						<tbody>
							<tr>
								<td class="graph" align="center">
									<b><xsl:text>Разрешение</xsl:text></b>
									<br/>
									<b><xsl:text>на ввоз товаров на территорию портовой особой экономической зоны, на земельный участок, прилегающий к автомобильному или железнодорожному пункту пропуска свободного порта Владивосток, Арктической зоны Российской Федерации, на котором применяется таможенная процедура свободной таможенной зоны, установленная для логистической особой экономической зоны, на отдельные участки морских портов, открытых для международного сообщения и захода иностранных морских судов, включая акваторию морского порта, и (или) на отдельные участки территории аэропорта, открытого для приема и отправки воздушных судов, выполняющих международные воздушные перевозки, находящиеся на территории свободного порта Владивосток, в Арктической зоне Российской Федерации, на участки территории свободного порта Республики Крым и города федерального значения Севастополя, на которых применяется таможенная процедура свободной таможенной зоны, установленная для портовой особой экономической зоны</xsl:text></b>
									<br/><br/>№ 
									<xsl:value-of select="impas:RegistrationNumber/impas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn2" select="impas:RegistrationNumber/impas:RegistrationDate"/>
									</xsl:call-template>/<xsl:value-of select="impas:RegistrationNumber/impas:Number"/>
									<xsl:if test="impas:RegistrationNumber/impas:AddNumber">
										<xsl:text>/</xsl:text>
										<xsl:value-of select="impas:RegistrationNumber/impas:AddNumber"/>
									</xsl:if>
								</td>
							</tr>
							<tr align="left">
								<td class="graphMain">
									<table style="width:297mm">
										<tbody>
											<tr>
												<td valign="bottom" colspan="4">Разрешается ввоз товаров:</td>
											</tr>
											<tr>
												<td align="center" class="bordered" valign="bottom" colspan="4">
													<xsl:choose>
														<xsl:when test="impas:Resident">
															<xsl:apply-templates select="impas:Resident/cat_ru:OrganizationName"/> 
															<xsl:if test="impas:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:for-each select="impas:Resident/RUScat_ru:SubjectAddressDetails">
																	<xsl:apply-templates select="."/>
																</xsl:for-each> 
															</xsl:if>
															<xsl:if test="impas:Resident/cat_ru:RFOrganizationFeatures">
																<xsl:if test="impas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="impas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																<xsl:if test="impas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="impas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																<xsl:if test="impas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="impas:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
															</xsl:if>
															<xsl:if test="impas:Resident/impas:CertificateNumber">
																свидетельство о включении в реестр резидентов Арктической зоны № 
																<xsl:apply-templates select="impas:Resident/impas:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																<xsl:apply-templates select="impas:Resident/impas:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="impas:Consignee/cat_ru:OrganizationName"/> 
															<xsl:if test="impas:Consignee/impas:Address">
																<xsl:for-each select="impas:Consignee/impas:Address">
																	<xsl:apply-templates select="."/>
																</xsl:for-each> 
															</xsl:if>
															<xsl:if test="impas:Consignee/cat_ru:RFOrganizationFeatures">
																<xsl:if test="impas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="impas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																<xsl:if test="impas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="impas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																<xsl:if test="impas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="impas:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
															</xsl:if>
															<xsl:if test="impas:Consignee/impas:CertificateNumber">
																свидетельство о включении в реестр резидентов Арктической зоны № 
																<xsl:apply-templates select="impas:Consignee/impas:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																<xsl:apply-templates select="impas:Consignee/impas:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle" colspan="4">(резидент портовой особой экономической зоны, свободного порта Владивосток, Арктической зоны Российской Федерации, участник свободной экономической зоны (далее - резидент или участник) или лицо, не являющееся резидентом или участником)</td>
											</tr>
											<tr>
												<td style="width:60mm" valign="bottom">для размещения</td>
												<td align="center" class="bordered" style="width:97mm" valign="bottom">
													<xsl:choose>
														<xsl:when test="impas:Resident">
															<xsl:for-each select="impas:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<xsl:for-each select="impas:Consignee/impas:Address">
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td style="width:60mm" valign="bottom">, по уведомлению</td>
												<td align="center" class="bordered" style="width:90mm" valign="bottom">
													<xsl:value-of select="impas:ImportNoticeRegNumber/impas:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
														<xsl:with-param name="dateIn2" select="impas:ImportNoticeRegNumber/impas:RegistrationDate"/>
													</xsl:call-template>/<xsl:value-of select="impas:ImportNoticeRegNumber/impas:Number"/>
													<xsl:if test="impas:ImportNoticeRegNumber/impas:AddNumber">
														<xsl:text>/</xsl:text>
														<xsl:value-of select="impas:ImportNoticeRegNumber/impas:AddNumber"/>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center" class="graphLittle">(место нахождения (адрес) участка резидента или участника или лица, не являющегося резидентом или участником)</td>
												<td/>
												<td align="center" class="graphLittle">(регистрационный номер уведомления о ввозе товаров)</td>
											</tr>
											<tr>
												<td valign="bottom" colspan="4">согласно следующим сведениям:</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" align="left">
									<br/>Таблица "Перечень товаров"<br/>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									<table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
										<tbody>
											<tr>
												<td rowspan="2">№ п/п</td>
												<td rowspan="2">Наименование товара</td>
												<td rowspan="2">Классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского кономического союза<sup>1</sup>/ идентификационные признаки товара</td>
												<td rowspan="2">Количество/ единица измерения</td>
												<td rowspan="2">Количество грузовых мест</td>
												<td rowspan="2">Вес товара, кг</td>
												<td rowspan="2">Вид упаковки</td>
												<td rowspan="2">Статус товара</td>
												<td colspan="2">Основание для вывоза</td>
											</tr>
											<tr>
												<td>договор хранения (при наличии) (наименование/ номер/дата)</td>
												<td>сведения о лице, заключившем договор хранения</td>
											</tr>
											<tr>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>
												<td>10</td>
											</tr>
											<xsl:for-each select="impas:GoodsList">
												<xsl:variable name="pos" select="position()"/>
												<tr>
													<td>
														<xsl:number value="position()"/>
													</td>
													<td>
														<xsl:for-each select="impas:GoodsDescription">
															<xsl:value-of select="."/> 
														</xsl:for-each>
													</td>
													<td>
														<xsl:value-of select="impas:GoodsTNVEDCode"/> 
													</td>
													<td>
														<xsl:value-of select="impas:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
														<xsl:value-of select="impas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
														<xsl:value-of select="impas:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
													</td>
													<td>
														<xsl:value-of select="impas:PackagesQuantity"/> 
													</td>
													<td>
														<xsl:value-of select="impas:WeighQuantity"/> 
													</td>
													<td>
														<xsl:value-of select="impas:PackagingKind"/> 
													</td>
													<td align="left">
														<xsl:for-each select="impas:GoodsStatus">
															<xsl:choose>
																<xsl:when test="not(impas:DTInfo/impas:DTGoods)">
																	<xsl:value-of select="impas:StatusSymbolicValue"/>
																	<xsl:if test="impas:CustomsModeCode">
																		<xsl:text>/ </xsl:text>
																		<xsl:value-of select="impas:CustomsModeCode"/>
																	</xsl:if>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:for-each select="impas:DTInfo/impas:DTGoods">
																		<xsl:if test="position()!=1"><br/></xsl:if>
																		<xsl:value-of select="../../impas:StatusSymbolicValue"/>
																		<xsl:if test="../../impas:CustomsModeCode">/ <xsl:value-of select="../../impas:CustomsModeCode"/>
																		</xsl:if>
																		<xsl:if test="../impas:GTDID">/
																			<xsl:value-of select="../impas:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_dt">
																				<xsl:with-param name="dateIn3" select="../impas:GTDID/cat_ru:RegistrationDate"/>
																			</xsl:call-template>/<xsl:value-of select="../impas:GTDID/cat_ru:GTDNumber"/>
																		</xsl:if> 
																		<xsl:if test="impas:GoodsNumeric">
																			<xsl:text>/ </xsl:text>
																			<xsl:value-of select="impas:GoodsNumeric"/>
																		</xsl:if>
																		<xsl:choose>
																			<xsl:when test="impas:SupplementaryQuantity">
																				<xsl:for-each select="impas:SupplementaryQuantity">/
																					<xsl:value-of select="cat_ru:GoodsQuantity"/> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																					<xsl:if test="cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																				</xsl:for-each>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:if test="impas:NetWeightQuantity">/
																					<xsl:value-of select="impas:NetWeightQuantity"/>
																					<xsl:text> кг</xsl:text>
																				</xsl:if>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</xsl:otherwise>
															</xsl:choose>
															<br/>
														</xsl:for-each>
													</td>
													<td>
														<xsl:if test="impas:GroundsForExport/impas:StorageAgreement/cat_ru:PrDocumentName">
															<xsl:value-of select="impas:GroundsForExport/impas:StorageAgreement/cat_ru:PrDocumentName"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="impas:GroundsForExport/impas:StorageAgreement/cat_ru:PrDocumentNumber">
															<xsl:text> № </xsl:text>
															<xsl:value-of select="impas:GroundsForExport/impas:StorageAgreement/cat_ru:PrDocumentNumber"/>
														</xsl:if>
														<xsl:if test="impas:GroundsForExport/impas:StorageAgreement/cat_ru:PrDocumentDate">
															<xsl:text> от </xsl:text>						
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="impas:GroundsForExport/impas:StorageAgreement/cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
													</td>
													<td>
														<xsl:apply-templates select="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:OrganizationName"/> 
														<xsl:if test="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:Address">
															<xsl:for-each select="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:Address">
																<xsl:apply-templates select="."/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:if test="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:RFOrganizationFeatures">
															<xsl:if test="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
															<xsl:if test="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
															<xsl:if test="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
														</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" align="left">
									<br/>Таблица "Перечень документов"<br/>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									<table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
										<tbody>
											<tr>
												<td>№ п/п</td>
												<td>Наименование документа</td>
												<td>Номер, дата документа</td>
											</tr>
											<tr>
												<td>1</td>
												<td>2</td>
												<td>3</td>
											</tr>
											<xsl:for-each select="impas:DocumentExp">
												<xsl:variable name="pos" select="position()"/>
												<tr>
													<td>
														<xsl:number value="position()"/>
													</td>
													<td>
														<xsl:value-of select="cat_ru:PrDocumentName"/>
													</td>
													<td>№ <xsl:value-of select="cat_ru:PrDocumentNumber"/> 
														от <xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="graphMain" border="0" style="width:297mm">
						<tbody>
							<tr>
								<td style="width:120mm" align="left" valign="bottom">Транспортное средство/без транспортного средства</td>
								<td align="center" class="bordered" style="width:187mm" valign="bottom">
									<xsl:choose>
										<xsl:when test="impas:TransportMeans/impas:TransportKind='1'">а/м </xsl:when>
										<xsl:when test="impas:TransportMeans/impas:TransportKind='2'">ж/д </xsl:when>
										<xsl:otherwise>авиа </xsl:otherwise>
									</xsl:choose>
									<xsl:if test="impas:TransportMeans/impas:TransportMark">
										(<xsl:value-of select="impas:TransportMeans/impas:TransportMark"/>) 
									</xsl:if>
									<xsl:value-of select="impas:TransportMeans/impas:ActiveTransportIdentifier"/>
									<xsl:if test="impas:TransportMeans/impas:TransportRegNumber">, 
										прицеп/полуприцеп <xsl:for-each select="impas:TransportMeans/impas:TransportRegNumber">
											<xsl:value-of select="."/> 
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:120mm" align="left" valign="bottom">Сборный груз</td>
								<td align="center" class="bordered" style="width:187mm" valign="bottom">
									<xsl:choose>
										<xsl:when test="impas:CombinedCargo='1'">ввоз товаров в составе сборного груза</xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td style="width:120mm" align="left" valign="bottom">Срок действия настоящего разрешения</td>
								<td align="center" class="bordered" style="width:187mm" valign="bottom">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="impas:LimitDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<table border="0" style="width:297mm">
						<tbody>
							<tr>
								<td class="graphMain">
									<table style="width:297mm">
										<tbody>
											<tr>
												<td class="bordered" style="width:110mm">
													<xsl:value-of select="impas:CustomsPerson/cat_ru:PersonName"/>
												</td>
												<td style="width:40mm"/>
												<td class="bordered" style="width:70mm">
													<xsl:value-of select="impas:CustomsPerson/cat_ru:LNP"/>
													<xsl:if test="impas:CustomsPerson/cat_ru:CustomsCode">
														<xsl:text> (код ТО: </xsl:text>
														<xsl:value-of select="impas:CustomsPerson/cat_ru:CustomsCode"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" style="width:110mm">(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)</td>
												<td style="width:40mm"/>
												<td class="graphLittle" style="width:70mm">(подпись)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle" align="left">
									<sup>1</sup> Решение Совета Евразийской экономической комиссии от 14 сентября 2021 г. № 80 "Об утверждении единой Товарной номенклатуры внешнеэкономической деятельности Евразийского экономического союза и Единого таможенного тарифа Евразийского экономического союза, а также об изменении и признании утратившими силу некоторых решений Совета Евразийской экономической комиссии", является обязательным для Российской Федерации в соответствии с Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом от 3 октября 2014 г. № 279-ФЗ "О ратификации Договора о Евразийском экономическом союзе" (Договор вступил в силу для Российской Федерации 1 января 2015 г.), вступило в силу 1 января 2022 г.
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
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
	<xsl:template name="russian_date_dt">
		<xsl:param name="dateIn3"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn3,5,1)='-' and substring($dateIn3,8,1)='-'">
				<xsl:value-of select="substring($dateIn3,9,2)"/>
				<xsl:value-of select="substring($dateIn3,6,2)"/>
				<xsl:value-of select="substring($dateIn3,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn3"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="impas:Resident/RUScat_ru:SubjectAddressDetails | impas:Consignor/impas:Address | impas:GroundsForExport/impas:ServiceOrganization/RUScat_ru:Address">
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
</xsl:stylesheet>
