<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Минфина России № 110н от 18 июля 2022 года "Об установлении Порядка проведения консультаций между таможенным органом и декларантом в целях обоснованного выбора стоимостной основы для определения таможенной стоимости ввозимых товаров в Российскую Федерацию, соответствующей статьям 41 и 42 Таможенного кодекса Евразийского экономического союза" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:dcvc="urn:customs.ru:Information:ExchangeDocuments:CustomsValueConsultationDecision:5.26.0">
	<!-- Шаблон для типа CustomsValueConsultationDecisionType -->
	<xsl:template match="dcvc:CustomsValueConsultationDecision">
		<xsl:param name="w" select="190"/>
		<xsl:param name="w1" select="300"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{/*white-space: normal;*/}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 10pt;
					/*font-style: italic;*/}

					.annot
					{font-family: Arial;
					font-size: 10pt;}

					.descr
					{font-family: Arial;
					font-size: 7pt;
					text-align: center}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 10pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

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
                </style>
			</head>
			<body>
				<xsl:if test="dcvc:ConsultationDecisionInfo">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr valign="top">
									<td width="60%"/>
									<td width="40%">
										<table>
											<tbody>
												<tr>
													<td class="value" align="center" valign="top">
														<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:OrganizationName"/>
														<xsl:if test="dcvc:OrganizationInfo/cat_ru:ShortName">
															<xsl:if test="dcvc:OrganizationInfo/cat_ru:OrganizationName">
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:ShortName"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td class="descr" align="center">(Полное наименование юридического лица либо фамилия, имя, отчество (при наличии) физического лица)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr valign="top">
									<td width="60%"/>
									<td width="40%" align="center">
										<xsl:text>№ </xsl:text>
										<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:DecisionRegNumber/dcvc:CustomsCode"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:DecisionRegNumber/dcvc:RegistrationDate" mode="date_num"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:DecisionRegNumber/dcvc:SerialNumber"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<xsl:text>Консультация</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="text-align:justify;">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonSurname">
													<xsl:value-of select="dcvc:CustomsPersonInfo/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonName">
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonMiddleName">
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonMiddleName"/>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonPost">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonPost"/>
												</xsl:if>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="dcvc:Customs"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество (при наличии), должность должностного лица с указанием наименования таможенного органа)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>рассмотрев запрос </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:OrganizationName"/>
												<xsl:if test="dcvc:OrganizationInfo/cat_ru:ShortName">
													<xsl:if test="dcvc:OrganizationInfo/cat_ru:OrganizationName">
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:ShortName"/>
												</xsl:if>
												<xsl:if test="dcvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text>, ИНН - </xsl:text>
													<xsl:apply-templates select="dcvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(полное наименование юридического лица либо фамилия, имя, отчество (при наличии) физического лица, идентификационный номер налогоплательщика)'"/>
											<xsl:with-param name="width" select="'70mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>от </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="dcvc:ConsultationDecisionInfo/dcvc:ApplicationNumber/dcvc:AppDate"/>
												</xsl:call-template>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(дата)'"/>
											<xsl:with-param name="width" select="'30mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>№ </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:ApplicationNumber/dcvc:ApplicationRegNumber/dcvc:CustomsCode"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:ApplicationNumber/dcvc:ApplicationRegNumber/dcvc:RegistrationDate" mode="date_num"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:ApplicationNumber/dcvc:ApplicationRegNumber/dcvc:SerialNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'60mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>о предоставлении стоимостной основы для определения таможенной стоимости ввозимых товаров в Российскую Федерацию, сообщает информацию об </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:choose>
													<xsl:when test="dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='false' or dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='f' or dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='0'">однородных</xsl:when>
													<xsl:when test="dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='true' or dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='t' or dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='1'">идентичных</xsl:when>
												</xsl:choose>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(идентичных/однородных)'"/>
											<xsl:with-param name="width" select="'40mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>товарах, ввезенных на таможенную территорию Евразийского экономического союза, наиболее соответствующих требованиям положений статей 41 и 42 Таможенного кодекса Евразийского экономического союза, по состоянию на </xsl:text>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="dcvc:ConsultationDecisionInfo/dcvc:DecisionRegNumber/dcvc:RegistrationDate"/>
										</xsl:call-template>
										&#160;<xsl:text>согласно прилагаемой таблице на </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:PagesNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'15mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>л. для использования ее в качестве стоимостной основы для определения таможенной стоимости ввозимых товаров в Российскую Федерацию по методу по стоимости сделки с </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:choose>
													<xsl:when test="dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='false' or dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='f' or dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='0'">однородными</xsl:when>
													<xsl:when test="dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='true' or dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='t' or dcvc:ConsultationDecisionInfo/dcvc:GoodsTypeIndicator='1'">идентичными</xsl:when>
												</xsl:choose>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(идентичными/однородными)'"/>
											<xsl:with-param name="width" select="'40mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>товарами.</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:for-each select="dcvc:CustomsChiefPersonInfo">
							<table>
								<tbody>
									<tr valign="bottom" align="center">
										<td class="value" width="55%"></td>
										<td width="5%">/</td>
										<td class="value" width="40%">
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr" width="55%">(подпись начальника уполномоченного таможенного органа)</td>
										<td width="5%"/>
										<td class="descr" width="40%">фамилия, имя, отчество (при наличии)</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</div>
					<div class="page" style="width: {$w1}mm;">
						<table>
							<tbody>
								<tr valign="top">
									<td width="60%">
										<xsl:text>Приложение</xsl:text>
										<br/>
										<xsl:text>к консультации № </xsl:text>
										<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:DecisionRegNumber/dcvc:CustomsCode"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:DecisionRegNumber/dcvc:RegistrationDate" mode="date_num"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="dcvc:ConsultationDecisionInfo/dcvc:DecisionRegNumber/dcvc:SerialNumber"/>
									</td>
									<td width="40%"/>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<xsl:text>Информация об идентичных/однородных товарах, ввезенных на таможенную территорию Евразийского экономического союза, наиболее соответствующих требованиям положений статей 41 и 42 Таможенного кодекса Евразийского экономического союза, по состоянию на </xsl:text>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="dcvc:ConsultationDecisionInfo/dcvc:DecisionRegNumber/dcvc:RegistrationDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered annot" rowspan="3">№ п/п</td>
									<td class="bordered annot" rowspan="3">Код ввозимого товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза</td>
									<td class="bordered annot" rowspan="3">Номера (при наличии таких сведений) и даты внешнеэкономического договора купли-продажи (договора поставки), действующих приложений, дополнений и изменений к нему (при наличии) или документов, которые являются основанием для поставки ввозимых товаров</td>
									<td class="bordered annot" rowspan="2" colspan="2">Наименование товаров</td>
									<td class="bordered annot" rowspan="3">Страна происхождения товаров</td>
									<td class="bordered annot" rowspan="2" colspan="2">Производитель товаров</td>
									<td class="bordered annot" colspan="4">Количество товаров</td>
									<td class="bordered annot" rowspan="2" colspan="2">Вид транспорта/условия поставки товаров</td>
									<td class="bordered annot" rowspan="3">Таможенная стоимость идентичных/ однородных товаров, руб.</td>
									<td class="bordered annot" rowspan="3">Источник информации (номер декларации на товары, порядковый номер товара в декларации на товары)</td>
									<td class="bordered annot" rowspan="3">Примечание</td>
								</tr>
								<tr valign="top" align="center">
									<td class="bordered annot" colspan="2">вес нетто, кг</td>
									<td class="bordered annot" colspan="2">в дополнительных единицах измерения (при наличии)</td>
								</tr>
								<tr valign="top" align="center">
									<td class="bordered annot">ввозимый товар</td>
									<td class="bordered annot">идентичный/ однородный товар</td>
									<td class="bordered annot">ввозимый товар</td>
									<td class="bordered annot">идентичный/ однородный товар</td>
									<td class="bordered annot">ввозимый товар</td>
									<td class="bordered annot">идентичный/ однородный товар</td>
									<td class="bordered annot">ввозимый товар</td>
									<td class="bordered annot">идентичный/ однородный товар</td>
									<td class="bordered annot">ввозимый товар</td>
									<td class="bordered annot">идентичный/ однородный товар</td>
								</tr>
								<tr valign="top" align="center">
									<td class="bordered annot">1</td>
									<td class="bordered annot">2</td>
									<td class="bordered annot">3</td>
									<td class="bordered annot">4</td>
									<td class="bordered annot">5</td>
									<td class="bordered annot">6</td>
									<td class="bordered annot">7</td>
									<td class="bordered annot">8</td>
									<td class="bordered annot">9</td>
									<td class="bordered annot">10</td>
									<td class="bordered annot">11</td>
									<td class="bordered annot">12</td>
									<td class="bordered annot">13</td>
									<td class="bordered annot">14</td>
									<td class="bordered annot">15</td>
									<td class="bordered annot">16</td>
									<td class="bordered annot">17</td>
								</tr>
								<xsl:for-each select="dcvc:ConsultationDecisionInfo/dcvc:IdenticalHomogeneousGoodsInfo">
									<tr valign="top">
										<td class="bordered annot">
											<xsl:value-of select="position()"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:GoodsTNVEDCode"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:PurchaseAgreement" mode="doc"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:GoodName/dcvc:ImportedGoodName"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:GoodName/dcvc:IdentHomogenGoodName"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:CountryOrigin/dcvc:CounryName"/>
											<xsl:text> (</xsl:text>
											<xsl:apply-templates select="dcvc:CountryOrigin/dcvc:CountryCode"/>
											<xsl:text>)</xsl:text>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:Manufacturer/dcvc:ImportedManufacturer"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:Manufacturer/dcvc:IdentHomogenManufacturer"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:NetWeightQuantity/dcvc:ImportedWeight"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:NetWeightQuantity/dcvc:IdentHomogenWeight"/>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="dcvc:SupplQuantity/dcvc:ImportedSupplQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:for-each select="dcvc:SupplQuantity/dcvc:IdentHomogenSupplQuantity">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="quantity"/>
											</xsl:for-each>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:DeliveryTerms/dcvc:ImportedDeliveryTerms/dcvc:TransportKind"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="dcvc:DeliveryTerms/dcvc:ImportedDeliveryTerms/dcvc:DeliveryTermsCode"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:DeliveryTerms/dcvc:IdentHomogenDeliveryTerms/dcvc:TransportKind"/>
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="dcvc:DeliveryTerms/dcvc:IdentHomogenDeliveryTerms/dcvc:DeliveryTermsCode"/>
										</td>
										<td class="bordered annot">
											<xsl:value-of select="translate(translate(format-number(dcvc:CustomsCost, '#,###.00'),',',' '),'.',',')"/>
										</td>
										<td class="bordered annot">
											<xsl:text>ДТ № </xsl:text>
											<xsl:apply-templates select="dcvc:InfoSource/dcvc:DTRegNumber" mode="reg_num"/>
											<xsl:text> товар № </xsl:text>
											<xsl:apply-templates select="dcvc:InfoSource/dcvc:GoodsNumeric"/>
										</td>
										<td class="bordered annot">
											<xsl:apply-templates select="dcvc:GoodNote"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="dcvc:RefusalConsultationInfo">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr valign="top">
									<td width="60%"/>
									<td width="40%">
										<table>
											<tbody>
												<tr>
													<td class="value" align="center" valign="top">
														<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:OrganizationName"/>
														<xsl:if test="dcvc:OrganizationInfo/cat_ru:ShortName">
															<xsl:if test="dcvc:OrganizationInfo/cat_ru:OrganizationName">
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:ShortName"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td class="descr" align="center">(Полное наименование юридического лица либо фамилия, имя, отчество (при наличии) физического лица)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr valign="top">
									<td width="60%"/>
									<td width="40%" align="center">
										<xsl:text>№ </xsl:text>
										<xsl:apply-templates select="dcvc:RefusalConsultationInfo/dcvc:DecisionRegNumber/dcvc:CustomsCode"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="dcvc:RefusalConsultationInfo/dcvc:DecisionRegNumber/dcvc:RegistrationDate" mode="date_num"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="dcvc:RefusalConsultationInfo/dcvc:DecisionRegNumber/dcvc:SerialNumber"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<xsl:text>Консультация</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="text-align:justify;">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonSurname">
													<xsl:value-of select="dcvc:CustomsPersonInfo/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonName">
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonMiddleName">
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonMiddleName"/>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonPost">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonPost"/>
												</xsl:if>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="dcvc:Customs"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество (при наличии), должность должностного лица с указанием наименования таможенного органа)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>рассмотрев запрос </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:OrganizationName"/>
												<xsl:if test="dcvc:OrganizationInfo/cat_ru:ShortName">
													<xsl:if test="dcvc:OrganizationInfo/cat_ru:OrganizationName">
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:ShortName"/>
												</xsl:if>
												<xsl:if test="dcvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text>, ИНН - </xsl:text>
													<xsl:apply-templates select="dcvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(полное наименование юридического лица либо фамилия, имя, отчество (при наличии) физического лица, идентификационный номер налогоплательщика)'"/>
											<xsl:with-param name="width" select="'70mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>от </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="dcvc:RefusalConsultationInfo/dcvc:ApplicationNumber/dcvc:AppDate"/>
												</xsl:call-template>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(дата)'"/>
											<xsl:with-param name="width" select="'30mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>№ </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="dcvc:RefusalConsultationInfo/dcvc:ApplicationNumber/dcvc:ApplicationRegNumber/dcvc:CustomsCode"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="dcvc:RefusalConsultationInfo/dcvc:ApplicationNumber/dcvc:ApplicationRegNumber/dcvc:RegistrationDate" mode="date_num"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="dcvc:RefusalConsultationInfo/dcvc:ApplicationNumber/dcvc:ApplicationRegNumber/dcvc:SerialNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'60mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>о предоставлении стоимостной основы для определения таможенной стоимости ввозимых товаров в Российскую Федерацию, информирует об отсутствии в распоряжении </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="dcvc:Customs"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование таможенного органа)'"/>
											<xsl:with-param name="width" select="'70mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>информации об идентичных и однородных товарах, проданных для вывоза на таможенную территорию Евразийского экономического союза и ввезенных в Российскую Федерацию в тот же или в соответствующий период времени, что и оцениваемые товары, соответствующей требованиям положений статей 41 и 42 Таможенного кодекса Евразийского экономического союза, по состоянию на </xsl:text>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="dcvc:RefusalConsultationInfo/dcvc:RefusalDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:for-each select="dcvc:CustomsChiefPersonInfo">
							<table>
								<tbody>
									<tr valign="bottom" align="center">
										<td class="value" width="55%"></td>
										<td width="5%">/</td>
										<td class="value" width="40%">
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr" width="55%">(подпись начальника уполномоченного таможенного органа)</td>
										<td width="5%"/>
										<td class="descr" width="40%">фамилия, имя, отчество (при наличии)</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</div>
				</xsl:if>
				<xsl:if test="dcvc:CancellationDocumentInfo">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr valign="top">
									<td width="60%"/>
									<td width="40%">
										<table>
											<tbody>
												<tr>
													<td class="value" align="center" valign="top">
														<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:OrganizationName"/>
														<xsl:if test="dcvc:OrganizationInfo/cat_ru:ShortName">
															<xsl:if test="dcvc:OrganizationInfo/cat_ru:OrganizationName">
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:value-of select="dcvc:OrganizationInfo/cat_ru:ShortName"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td class="descr" align="center">(Полное наименование юридического лица либо фамилия, имя, отчество (при наличии) физического лица)</td>
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
								<tr>
									<td align="center" class="title">
										<xsl:text>Решение</xsl:text>
										<br/>
										<xsl:text>о прекращении действия выданного в результате проведения консультации документа</xsl:text>
										<br/>
										<xsl:text>от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="dcvc:CancellationDocumentInfo/dcvc:CancelDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="text-align:justify;">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonSurname">
													<xsl:value-of select="dcvc:CustomsPersonInfo/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonName">
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonMiddleName">
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonMiddleName"/>
												</xsl:if>
												<xsl:if test="dcvc:CustomsPersonInfo/cat_ru:PersonPost">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="dcvc:CustomsPersonInfo/cat_ru:PersonPost"/>
												</xsl:if>
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="dcvc:Customs"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество (при наличии), должность должностного лица с указанием наименования таможенного органа)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>уведомляет о прекращении действия документа № </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="dcvc:CancellationDocumentInfo/dcvc:CancelDecisionRegNumber/dcvc:CustomsCode"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="dcvc:CancellationDocumentInfo/dcvc:CancelDecisionRegNumber/dcvc:RegistrationDate" mode="date_num"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="dcvc:CancellationDocumentInfo/dcvc:CancelDecisionRegNumber/dcvc:SerialNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(регистрационный номер прекращаемого решения)'"/>
											<xsl:with-param name="width" select="'60mm'"/>
										</xsl:call-template>
										&#160;<xsl:text>по следующим причинам:</xsl:text>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="dcvc:CancellationDocumentInfo/dcvc:CancelReason"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(причины прекращения действия выданного в результате проведения консультации документа)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:for-each select="dcvc:CustomsChiefPersonInfo">
							<table>
								<tbody>
									<tr valign="bottom" align="center">
										<td class="value" width="55%"></td>
										<td width="5%">/</td>
										<td class="value" width="40%">
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr" width="55%">(подпись начальника уполномоченного таможенного органа)</td>
										<td width="5%"/>
										<td class="descr" width="40%">фамилия, имя, отчество (при наличии)</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
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
						<xsl:value-of select="$data"/>
						<br/>
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
					<xsl:if test="$comma != 0 and $list != 0 and $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="date_num"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber' or local-name() = 'Number']"/>
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
	
	<xsl:template match="dcvc:ResidentCertificate">
		<xsl:text> свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="dcvc:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="dcvc:CertificateDate" mode="russian_date"/>
	</xsl:template>
	
	<xsl:template match="dcvc:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
	</xsl:template>

	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<span class="value">&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</span>
				<xsl:text>" </xsl:text>
				<span class="value">&#160;<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>&#160;</span>
					<xsl:text> 20</xsl:text>
				<span class="value">
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</span>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:choose>
			<xsl:when test="$number = '01'">января</xsl:when>
			<xsl:when test="$number = '02'">февраля</xsl:when>
			<xsl:when test="$number = '03'">марта</xsl:when>
			<xsl:when test="$number = '04'">апреля</xsl:when>
			<xsl:when test="$number = '05'">мая</xsl:when>
			<xsl:when test="$number = '06'">июня</xsl:when>
			<xsl:when test="$number = '07'">июля</xsl:when>
			<xsl:when test="$number = '08'">августа</xsl:when>
			<xsl:when test="$number = '09'">сентября</xsl:when>
			<xsl:when test="$number = '10'">октября</xsl:when>
			<xsl:when test="$number = '11'">ноября</xsl:when>
			<xsl:when test="$number = '12'">декабря</xsl:when>
		</xsl:choose>
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
	<xsl:template name="date_num">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='CustomsValueConsultationDecision']//*" priority="-1">
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
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="date_num">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_num">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
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
