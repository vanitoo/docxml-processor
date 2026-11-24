<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 27 января 2011 г. N 150 "Об утверждении формы заявления об уплате акциза по маркированным товарам Таможенного союза, ввозимым на территорию Российской Федерации с территории государства - члена Таможенного союза"  -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0"
	xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0"
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0"
	xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0"
	xmlns:epa="urn:customs.ru:Information:ELSDocuments:ExcisePaymentApplication:5.28.0"
	xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:param name="NsiValues"/>
	<!-- Шаблон для типа ExcisePaymentApplicationType -->
	<!--<xsl:include href="SumInWords.xslt"/>-->
	<xsl:template match="epa:ExcisePaymentApplication">
		<xsl:param name="w" select="277"/>
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div
					{
					white-space: normal;
					}

					div.page {
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					table.border tr td
					{
					border: 1px solid windowtext;
					}

					.value
					{
					border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;
					}

					.annot
					{
					font-family: Arial;
					font-size: 11pt;
					}


					.title
					{
					font-weight:bold;
					font-family: Arial;
					font-size: 11pt;
					}

					tr.title td
					{
					font-weight:bold;
					font-family: Arial;
					font-size: 9pt;
					}



					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					font-size: 9pt;
					}

					.noborder { border-collapse: collapse; }
					td.noborder
					{
					font-size: 9pt;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
					.inlinetable
					{
					border: 0;
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
					text-align: center;
					}
					.descr{
					font-size: 8pt;
					text-align: center;
					vertical-align: top;
					}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<div class="title" align="center">
						Заявление об уплате акциза по маркированным товарам Таможенного союза, ввозимым на территорию Российской Федерации<br/>с территории государства - члена Таможенного союза
					</div>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="50%" class="title">РАЗДЕЛ 1</td>
								<td align="right">
									<xsl:text>Страница</xsl:text>
								</td>
								<td width="1%"/>
								<td style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></td>
								<td width="1%"/>
								<td width="2%" align="center">
									<xsl:text>из</xsl:text>
								</td>
								<td width="1%"/>
								<td style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td colspan="3">Дата заполнения заявления и его номер</td>
							</tr>
							<tr>
								<td width="25%"></td>
								<td width="50%" valign="top">
									<table>
										<tbody>
											<tr align="center">
												<td width="1%">№</td>
												<td width="40%" style="border-bottom:1px solid black;">
													<xsl:apply-templates select="epa:AppExcisePaymentDocument/cat_ru:PrDocumentNumber"/>
												</td>
												<td width="3%"></td>
												<td width="15%" style="border-bottom:1px solid black;">
													<xsl:value-of select="substring(epa:AppExcisePaymentDocument/cat_ru:PrDocumentDate, 9, 2)"/>
												</td>
												<td width="3%"></td>
												<td width="15%" style="border-bottom:1px solid black;">
													<xsl:value-of select="substring(epa:AppExcisePaymentDocument/cat_ru:PrDocumentDate, 6, 2)"/>
												</td>
												<td width="3%"></td>
												<td>20</td>
												<td  width="10%" style="border-bottom:1px solid black;">
													<xsl:value-of select="substring(epa:AppExcisePaymentDocument/cat_ru:PrDocumentDate, 3, 2)"/>
												</td>
												<td>г.</td>
											</tr>
											<tr align="center">
												<td></td>
												<td class="descr">(номер заявления)</td>
												<td></td>
												<td class="descr">(число)</td>
												<td></td>
												<td class="descr">(месяц)</td>
												<td></td>
												<td></td>
												<td class="descr">(год)</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="25%"></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top">
								<td width="49%">
									<!-- продавец -->
									<table>
										<tbody>
											<tr>
												<td width="30%" class="title">
													Продавец
												</td>
												<td width="70%" style="border: 1px solid black;">
													<xsl:for-each select="epa:Supplier/cat_ru:RBOrganizationFeatures">
														<xsl:apply-templates select="cat_ru:UNP"/>
													</xsl:for-each>
													<xsl:for-each select="epa:Supplier/cat_ru:RFOrganizationFeatures">
														<xsl:apply-templates select="cat_ru:INN"/>
														<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
														<xsl:apply-templates select="cat_ru:KPP"/>
													</xsl:for-each>
													<xsl:for-each select="epa:Supplier/cat_ru:RKOrganizationFeatures">
														<xsl:apply-templates select="cat_ru:ITN/cat_ru:RNN"/>
														<xsl:text>/</xsl:text>
														<xsl:apply-templates select="cat_ru:BIN"/>
														<xsl:text>/</xsl:text>
														<xsl:apply-templates select="cat_ru:IIN"/>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td></td>
												<td>УНП или ИНН/КПП или РНН/(БИН/ИИН)</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr valign="top">
												<td width="1%" class="title">01</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Supplier" mode="orgName"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(наименование организации, Ф.И.О. индивидуального предпринимателя)
												</td>
											</tr>
											<tr valign="top">
												<td width="1%" class="title">03</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Supplier" mode="address"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(код страны, место нахождения (жительства))
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="2%"/>
								<td width="49%">
									<!-- покупатель -->
									<table>
										<tbody>
											<tr>
												<td width="30%" class="title">
													Покупатель
												</td>
												<td width="70%" style="border: 1px solid black;">
													<xsl:for-each select="epa:Supplier/cat_ru:RFOrganizationFeatures">
														<xsl:apply-templates select="cat_ru:INN"/>
														<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
														<xsl:apply-templates select="cat_ru:KPP"/>
														<xsl:if test="cat_ru:OGRN">, </xsl:if>
														<xsl:apply-templates select="cat_ru:OGRN"/>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td></td>
												<td>ИНН/КПП, ОКПО</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr valign="top">
												<td width="1%" class="title">02</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Buyer" mode="orgName"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(наименование организации, Ф.И.О. индивидуального предпринимателя)
												</td>
											</tr>
											<tr valign="top">
												<td width="1%" class="title">04</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Buyer" mode="address"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(код страны, место нахождения (жительства))
												</td>
											</tr>
											<tr valign="top">
												<td width="1%" class="title">05</td>
												<td style="border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:Buyer/epa:BankAccInfo"/>
												</td>
											</tr>
											<tr>
												<td width="1%" class="title"></td>
												<td class="descr">
													(банковские реквизиты)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table>
										<tbody>
											<tr>
												<td width="1%" class="title">06</td>
												<td>
													<xsl:text> Номер договора (контракта) </xsl:text>
												</td>
												<td style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:ContractDocument/cat_ru:PrDocumentNumber"/>
												</td>
												<td width="5%"/>
												<td>
													<xsl:text> Дата договора (контракта) </xsl:text>
												</td>
												<td style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:ContractDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
													<xsl:text> г.</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table>
										<tbody>
											<tr valign="top">
												<td width="1%" class="title">07</td>
												<td>
													<xsl:text>Производитель товара: </xsl:text>
													<table>
														<tbody>
															<tr>
																<td style="border-bottom: 1px solid black;">
																	<xsl:for-each select="epa:Producer">
																		<xsl:apply-templates select="epa:CountryCode"/>
																		<xsl:text> </xsl:text>
																		<xsl:apply-templates select="epa:ProducerName"/>
																		<xsl:text> </xsl:text>
																		<xsl:if test="epa:Address">
																			<xsl:text> Адрес: </xsl:text>
																			<xsl:apply-templates select="." mode="address"/>
																		</xsl:if>
																	</xsl:for-each>
																</td>
															</tr>
															<tr>
																<td class="descr">
																	(код страны происхождения товара, наименование производителя, его местонахождение (адрес))
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table>
										<tbody>
											<tr>
												<td width="1%" class="title">08</td>
												<td>
													<xsl:text> Номер заявления о выдаче (приобретении) акцизных марок </xsl:text>
												</td>
												<td style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:AppBuyExciseStampsDocument/cat_ru:PrDocumentNumber"/>
													<!--xsl:text> / </xsl:text>
													<div style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													</div>
													<xsl:text> / </xsl:text>
													<div style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													</div-->
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
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п</td>
								<td class="bordered" rowspan="2">Наименование товара</td>
								<td class="bordered" rowspan="2">Код товара ТН ВЭД ТС</td>
								<td class="bordered" rowspan="2">Количе-ство товара в нату-ральном выражении</td>
								<td class="bordered" rowspan="2">Количество товара в единицах, используе-мых для расчета акциза</td>
								<td class="bordered" rowspan="2">Единица измерения количества товара для целей применения ставки акциза</td>
								<td class="bordered" colspan="2">Стоимость товара</td>
								<td class="bordered" colspan="2">Валюта</td>
								<td class="bordered" rowspan="2">Серии и номера акцизных марок</td>
								<td class="bordered" colspan="2">Транспортный (товаросопрово-дительный) документ</td>
								<td class="bordered" colspan="2">Счет-фактура</td>
								<td class="bordered" rowspan="2">Дата принятия товара на учет</td>
								<td class="bordered" rowspan="2">Налого-вая база</td>
								<td class="bordered" rowspan="2">Ставка акциза</td>
								<td class="bordered" rowspan="2">Сумма акциза к уплате</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">в рублях</td>
								<td class="bordered">в валюте договора</td>
								<td class="bordered">код</td>
								<td class="bordered">курс</td>
								<td class="bordered">серия, номер</td>
								<td class="bordered">дата</td>
								<td class="bordered">номер</td>
								<td class="bordered">дата</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
								<td class="bordered">8</td>
								<td class="bordered">9</td>
								<td class="bordered">10</td>
								<td class="bordered">11</td>
								<td class="bordered">12</td>
								<td class="bordered">13</td>
								<td class="bordered">14</td>
								<td class="bordered">15</td>
								<td class="bordered">16</td>
								<td class="bordered">17</td>
								<td class="bordered">18</td>
								<td class="bordered">19</td>
							</tr>
							<xsl:for-each select="epa:GoodsInfo">
								<tr valign="top">
									<td class="bordered">
										<xsl:apply-templates select="epa:GoodsNumeric"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:GoodsDescription"/>
										<xsl:if test="epa:SeasonalMultiplier">
											<br/>
											<xsl:text>Применен сезонный коэффициент </xsl:text>
											<xsl:apply-templates select="epa:SeasonalMultiplier"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:GoodsTNVEDCode"/>
									</td>
									<td class="bordered">
                    <xsl:if test="epa:UnifiedNetMassMeasure">
                      <xsl:value-of select="epa:UnifiedNetMassMeasure"/>
                    </xsl:if>
									</td>
									<td class="bordered">
										<xsl:for-each select="epa:GoodsMeasureDetails">
											<xsl:value-of select="cat_ru:GoodsQuantity"/>
											<br/>
										</xsl:for-each>
										<xsl:apply-templates select="epa:GoodsMeasureDetails[2]/cat_ru:GoodsQuantity"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="epa:GoodsMeasureDetails">
											<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
											<br/>
										</xsl:for-each>
										<xsl:apply-templates select="epa:GoodsMeasureDetails[2]/cat_ru:MeasureUnitQualifierName"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoicedCost"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoicedCostCur"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:CurCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:CurRate"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="epa:IssueStampInfo">
											<xsl:if test="position() != 1">
												<br/>
											</xsl:if>
											<xsl:if test="catESAD_cu:ExciseSerieses">
												<xsl:apply-templates select="catESAD_cu:ExciseSerieses"/>
											</xsl:if>
											<xsl:if test="catESAD_cu:ExciseList or catESAD_cu:ExciseRange">
												<xsl:text> № </xsl:text>
												<xsl:for-each select="catESAD_cu:ExciseList/catESAD_cu:ExciseNumber">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:ExciseList and catESAD_cu:ExciseRange">, </xsl:if>
												<xsl:for-each select="catESAD_cu:ExciseRange">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="catESAD_cu:ExciseFirstNumber"/>
													<xsl:text> - </xsl:text>
													<xsl:apply-templates select="catESAD_cu:ExciseLastNumber"/>
												</xsl:for-each>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:TransDocument/cat_ru:PrDocumentNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:TransDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoiceDocument/cat_ru:PrDocumentNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:InvoiceDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:GoodsAccDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:TaxBase"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:ExciseRate"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="epa:ExciseSum"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="title" colspan="6">Достоверность и полноту сведений, приведенных в данном заявлении, подтверждаем:</td>
							</tr>
							<tr align="center">
								<td width="40%" style="border-bottom:1px solid black;">
									<xsl:for-each select="epa:DirSignature">
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
									</xsl:for-each>
								</td>
								<td width="5%"/>
								<td width="15%" style="border-bottom:1px solid black;">
									<br/>
								</td>
								<td width="5%"/>
								<td width="15%" style="border-bottom:1px solid black;">
									<xsl:apply-templates select="epa:DirSignature/cat_ru:IssueDate" mode="russian_date"/>
								</td>
								<td width="10" class="title" align="center" valign="middle" rowspan="4">М.П.</td>
							</tr>
							<tr>
								<td class="descr">(Ф.И.О. руководителя организации (уполномоченного лица) - покупателя (индивидуального предпринимателя - покупателя))</td>
								<td/>
								<td class="descr">(подпись)</td>
								<td/>
								<td class="descr">(дата)</td>
							</tr>
							<tr align="center">
								<td style="border-bottom:1px solid black;">
									<xsl:for-each select="epa:MainAcnSignature">
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
									</xsl:for-each>
								</td>
								<td/>
								<td style="border-bottom:1px solid black;">
									<br/>
								</td>
								<td/>
								<td style="border-bottom:1px solid black;">
									<xsl:apply-templates select="epa:MainAcnSignature/cat_ru:IssueDate" mode="russian_date"/>
								</td>
							</tr>
							<tr>
								<td class="descr">(Ф.И.О. главного бухгалтера)</td>
								<td/>
								<td class="descr">(подпись)</td>
								<td/>
								<td class="descr">(дата)</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td width="50%" class="title">РАЗДЕЛ 2</td>
								<td align="right">
									<xsl:text>Страница</xsl:text>
								</td>
								<td width="1%"/>
								<td style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></td>
								<td width="1%"/>
								<td width="2%" align="center">
									<xsl:text>из</xsl:text>
								</td>
								<td width="1%"/>
								<td style="display:inline-block;width: 10mm; height:4mm; border: 1px solid black;"></td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr valign="top">
								<td class="bordered" width="50%">
									<xsl:text>Отметка о регистрации заявления при предоставлении в таможенный орган</xsl:text>
									<br/>
									<br/>
									<table>
										<tbody>
											<tr valign="top">
												<td class="noborder">
													<xsl:text>Регистрационный номер заявления </xsl:text>
												</td>
												<td class="noborder" align="center" style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:AppExcisePaymentDocReg/cat_ru:PrDocumentNumber"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="bordered" width="50%">
									<xsl:text>Отметка таможенного органа об уплате акциза</xsl:text>
									<br/>
									<br/>

									<xsl:variable name="splittedSum">
										<xsl:value-of select="translate(sum(epa:GoodsInfo/epa:ExciseSum),'.',',')"/>
									</xsl:variable>

									<table>
										<tbody>
											<tr valign="top">
												<td class="noborder">
													<xsl:text>Акцизы в сумме </xsl:text>
												</td>
												<td align="center" class="noborder" style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													<xsl:value-of select="substring-before($splittedSum, ',')"/>
												</td>
												<td align="center" class="noborder">
													<xsl:text> рублей </xsl:text>
												</td>
												<td align="center" class="noborder" style="display:inline-block; width:30mm; border-bottom: 1px solid black;">
													<xsl:value-of select="substring-after($splittedSum, ',')"/>
												</td>
												<td class="noborder">
													<xsl:text> копеек</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr>
												<td class="noborder" width="85%" style="border-bottom: 1px solid black;">

													<xsl:text>(</xsl:text>
													<xsl:variable name="integerPart">
														<xsl:choose>
															<xsl:when test="substring-before($splittedSum,',')!=''">
																<xsl:value-of select="substring-before($splittedSum,',')"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="$splittedSum"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:variable>
													<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
													<xsl:choose>
														<xsl:when test="$integerPart!='0'">
															<xsl:call-template name="num-to-word">
																<xsl:with-param name="value" select="$integerPart"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>0</xsl:otherwise>
													</xsl:choose>
													<xsl:text> руб. </xsl:text>
													<xsl:if test="$fractionalPart!=''">
														<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
														<xsl:text> коп.</xsl:text>
													</xsl:if>
													<xsl:text>)</xsl:text>
												</td>
												<td align="center" class="noborder"> уплачены</td>
											</tr>
											<tr>
												<td class="descr">(указывается уплаченная сумма акциза прописью)</td>
												<td></td>
											</tr>
										</tbody>
									</table>
									<br/>
									<table>
										<tbody>
											<tr valign="top">
												<td class="noborder">
													<xsl:text>Платежный документ </xsl:text>
												</td>
												<td align="center" class="noborder" style="display:inline-block; width:30mm; height:4mm; border-bottom: 1px solid black;">
													<xsl:value-of select="epa:PaymentDocument/cat_ru:PrDocumentNumber"/>
												</td>
												<td align="center" class="noborder">
													<xsl:text> от </xsl:text>
												</td>
												<td align="center" class="noborder" style="display:inline-block; width:30mm; height:4mm; border-bottom: 1px solid black;">
													<xsl:apply-templates select="epa:PaymentDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
									<br/>
									<table>
										<tbody>
											<tr>
												<td class="noborder" align="center" style="border-bottom: 1px solid black; width: 40%">
													<xsl:apply-templates select="epa:InspectorSignature" mode="fio"/>
												</td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td class="noborder" align="center" style="border-bottom: 1px solid black; width: 20%">
													<xsl:apply-templates select="epa:InspectorSignature/cat_ru:IssueDate" mode="russian_date"/>
												</td>
											</tr>
											<tr>
												<td class="descr">
													<xsl:text>(Ф.И.О. инспектора)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(дата)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
									<table>
										<tbody>
											<tr>
												<td class="noborder" align="center" style="border-bottom: 1px solid black; width: 40%">
													<xsl:apply-templates select="epa:CustHeadSignature" mode="fio"/>
												</td>
												<td width="5%"/>
												<td style="border-bottom: 1px solid black; width: 30%"></td>
												<td width="5%"/>
												<td class="noborder" align="center" style="border-bottom: 1px solid black; width: 20%">
													<xsl:apply-templates select="epa:CustHeadSignature/cat_ru:IssueDate" mode="russian_date"/>
												</td>
											</tr>
											<tr>
												<td class="descr">
													<xsl:text>(начальник (заместитель начальника) таможенного органа)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(дата)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="epa:ExciseRate">
		<xsl:apply-templates select="epa:DutyTaxFeeRateValue"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="not(epa:RateTypeCode)">RUB</xsl:when>
			<xsl:when test="epa:RateTypeCode = '%'">%</xsl:when>
			<xsl:when test="epa:RateTypeCode = '*'">
				<xsl:choose>
					<xsl:when test="epa:RateCurrencyCode">
						<xsl:apply-templates select="epa:RateCurrencyCode" mode="currency"/>
					</xsl:when>
					<xsl:otherwise> RUB</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="epa:RateTNVEDQualifierCode">
					<xsl:text> за </xsl:text>
					<xsl:value-of select="epa:WeightingFactor"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="epa:RateTNVEDQualifierCode" mode="qualCode"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="epa:Rate3">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="epa:OperationsSign"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="epa:Rate3"/>
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="not(epa:RateTypeCode3)">RUB</xsl:when>
				<xsl:when test="epa:RateTypeCode3 = '%'">%</xsl:when>
				<xsl:when test="epa:RateTypeCode3 = '*'">
					<xsl:choose>
						<xsl:when test="epa:RateCurrencyCode3">
							<xsl:apply-templates select="epa:RateCurrencyCode3" mode="currency"/>
						</xsl:when>
						<xsl:otherwise> RUB</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="epa:RateTNVEDQualifierCode3">
						<xsl:text> за </xsl:text>
						<xsl:value-of select="epa:WeightingFactor3"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="epa:RateTNVEDQualifierCode3" mode="qualCode"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="epa:Rate2">
			<xsl:choose>
				<xsl:when test="epa:ComparisonOperationsSign='1' or not(epa:ComparisonOperationsSign)">, но не менее </xsl:when>
				<xsl:when test="epa:ComparisonOperationsSign='2'">, но не более </xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="epa:ComparisonOperationsSign"/>
					<xsl:text> </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="epa:Rate2"/>
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="not(epa:RateTypeCode2)">RUB</xsl:when>
				<xsl:when test="epa:RateTypeCode2 = '%'">%</xsl:when>
				<xsl:when test="epa:RateTypeCode2 = '*'">
					<xsl:choose>
						<xsl:when test="epa:RateCurrencyCode2">
							<xsl:apply-templates select="epa:RateCurrencyCode2" mode="currency"/>
						</xsl:when>
						<xsl:otherwise> RUB</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="epa:RateTNVEDQualifierCode2">
						<xsl:text> за </xsl:text>
						<xsl:value-of select="epa:WeightingFactor2"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="epa:RateTNVEDQualifierCode2" mode="qualCode"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="currency">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:variable name="val" select="."/>
			<xsl:choose>
				<xsl:when test="$NsiValues">
					<xsl:value-of select="$NsiValues/VALNAME[@KOD = $val]/@BUK"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="string($val)='643'">RUB</xsl:when>
						<xsl:when test="string($val)='978'">EUR</xsl:when>
						<xsl:when test="string($val)='840'">USD</xsl:when>
						<xsl:otherwise>
							<xsl:text> (код: </xsl:text>
							<xsl:value-of select="."/>
							<xsl:text>) </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>

	<xsl:template match="*" mode="qualCode">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>

		<element xml_node="{$xpath_date}">
			<xsl:variable name="val" select="."/>
			<xsl:choose>
				<xsl:when test="$NsiValues">
					<xsl:value-of select="$NsiValues/EDIZM[@KOD = $val]/@KRNAIM"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test=".='006'"> МЕТР</xsl:when>
						<xsl:when test=".='055'"> КВАДРАТНЫЙ МЕТР</xsl:when>
						<xsl:when test=".='111'"> КУБИЧЕСКИЙ САНТИМЕТР</xsl:when>
						<xsl:when test=".='112'"> ЛИТР</xsl:when>
						<xsl:when test=".='113'"> КУБИЧЕСКИЙ МЕТР</xsl:when>
						<xsl:when test=".='114'"> 1000 КУБИЧЕСКИХ МЕТРОВ</xsl:when>
						<xsl:when test=".='117'"> ТОННУ ПОЛНОЙ МАССЫ</xsl:when>
						<xsl:when test=".='118'"> КУБИЧЕСКИЙ МЕТР ПОЛНОГО ОБЪЕМА КУЗОВА</xsl:when>
						<xsl:when test=".='130'"> 1000 ЛИТРОВ</xsl:when>
						<xsl:when test=".='162'"> МЕТРИЧЕСКИЙ КАРАТ</xsl:when>
						<xsl:when test=".='163'"> ГРАММ</xsl:when>
						<xsl:when test=".='166'"> КИЛОГРАММ</xsl:when>
						<xsl:when test=".='168'"> ТОННУ ВЕСА НЕТТО</xsl:when>
						<xsl:when test=".='185'"> ГРУЗОПОДЪЕМНОСТЬ В ТОННАХ</xsl:when>
						<xsl:when test=".='214'"> КИЛОВАТТ</xsl:when>
						<xsl:when test=".='246'"> 1000 КИЛОВАТТ В ЧАС</xsl:when>
						<xsl:when test=".='251'"> ЛОШАДИНУЮ СИЛУ</xsl:when>
						<xsl:when test=".='305'"> КЮРИ</xsl:when>
						<xsl:when test=".='306'"> ГРАММ ДЕЛЯЩИХСЯ ИЗОТОПОВ</xsl:when>
						<xsl:when test=".='715'"> ПАРУ</xsl:when>
						<xsl:when test=".='796'"> ШТУКУ</xsl:when>
						<xsl:when test=".='797'"> СТО ШТУК</xsl:when>
						<xsl:when test=".='798'"> ТЫСЯЧУ ШТУК</xsl:when>
						<xsl:when test=".='831'"> ЛИТР ЧИСТОГО (100%) СПИРТА</xsl:when>
						<xsl:when test=".='841'"> КИЛОГРАММ ПЕРОКСИДА ВОДОРОДА</xsl:when>
						<xsl:when test=".='845'"> КИЛОГРАММ СУХОГО НА 90% ВЕЩЕСТВА</xsl:when>
						<xsl:when test=".='852'"> КИЛОГРАММ ОКСИДА КАЛИЯ</xsl:when>
						<xsl:when test=".='859'"> КИЛОГРАММ ГИДРОКСИДА КАЛИЯ</xsl:when>
						<xsl:when test=".='861'"> КИЛОГРАММ АЗОТА</xsl:when>
						<xsl:when test=".='863'"> КИЛОГРАММ ГИДРОКСИДА НАТРИЯ</xsl:when>
						<xsl:when test=".='865'"> КИЛОГРАММ ПЯТИОКСИДА ФОСФОРА</xsl:when>
						<xsl:when test=".='867'"> КИЛОГРАММ УРАНА</xsl:when>
						<xsl:otherwise>
							<xsl:text> (код ед.изм.: </xsl:text>
							<xsl:value-of select="."/>
							<xsl:text>)</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>

	<xsl:template match="epa:BankAccInfo">
		<xsl:apply-templates select="cat_ru:BankName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:BankAccount">
			<xsl:text>Номер счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccount">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankAccountDescription">
			<xsl:text> Описание: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccountDescription">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<xsl:text> БИК </xsl:text>
			<xsl:apply-templates select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<xsl:text> SWIFT </xsl:text>
			<xsl:apply-templates select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<xsl:text> Корр.счет </xsl:text>
			<xsl:apply-templates select="cat_ru:CorrAccount"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="address">
		<xsl:for-each select="*[local-name() = 'Address']/*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="*" mode="orgName">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
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
	<xsl:template match="//*[local-name()='ExcisePaymentApplication']//*" priority="-1">
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

	<xsl:template name="num-to-word">
		<xsl:param name="value"/>
		<xsl:param name="sex" select="'m'"/>
		<xsl:variable name="power" select="0"/>

		<xsl:variable name="value2">
			<xsl:value-of select="translate($value,',','.')"/>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="floor($value2) > 0">
				<xsl:call-template name="float2speech">
					<xsl:with-param name="value" select="floor($value2)"/>
					<xsl:with-param name="sex" select="m"/>
					<xsl:with-param name="power" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'ноль '"/>
			</xsl:otherwise>
		</xsl:choose>

		<!--xsl:text> руб. </xsl:text>
		<xsl:choose>
			<xsl:when test="floor($value2)!=$value2">
				<xsl:variable name="kop" select="round((($value2)-floor($value2))*100)"/>
				<xsl:choose>
					<xsl:when test="$kop > 9">
						<xsl:value-of select="concat($kop,' коп.')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('0',$kop,' коп.')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'00 коп.'"/>
			</xsl:otherwise>
		</xsl:choose-->

	</xsl:template>

	<xsl:template name="float2speech">
		<xsl:param name="value"/>
		<xsl:param name="sex"/>
		<xsl:param name="power"/>
		<xsl:variable name="ret" select="' '"/>

		<xsl:variable name="pp" >
			<xsl:choose>
				<xsl:when test="$power!=0">
					<xsl:if test="$power=1">
						<xsl:value-of select="'f'"/>
					</xsl:if>
					<xsl:if test="$power!=1">
						<xsl:value-of select="'m'"/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$sex"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="strx">
			<xsl:if test="$power!=0">
				<xsl:variable name="p">
					<xsl:choose>
						<xsl:when test="$power!=0">
							<xsl:if test="$power=1">
								<xsl:value-of select="'f'"/>
							</xsl:if>
							<xsl:if test="$power!=1">
								<xsl:value-of select="'m'"/>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$sex"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:variable name="i" select="floor($value)"/>
				<xsl:variable name="x" select="floor(($i mod 100) div 10)"/>

				<xsl:variable name="z">
					<xsl:choose>
						<xsl:when test="$x=1">
							<xsl:number value="5"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$i mod 10"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:variable name="ret2">
					<xsl:choose>
						<xsl:when test="$z=1">
							<xsl:if test="$p='m'">
								<xsl:value-of select="concat(' ',$ret)"/>
							</xsl:if>
							<xsl:if test="$p='f'">
								<xsl:value-of select="concat('а ',$ret)"/>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$z > 1 and $z &lt; 5">
							<xsl:if test="$p='m'">
								<xsl:value-of select="concat('а ',$ret)"/>
							</xsl:if>
							<xsl:if test="$p='f'">
								<xsl:value-of select="concat('и ',$ret)"/>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$p='m'">
								<xsl:value-of select="concat('ов ',$ret)"/>
							</xsl:if>
							<xsl:if test="$p='f'">
								<xsl:value-of select="concat(' ',$ret)"/>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:choose>
					<xsl:when test="($value mod 1000)=0">
						<xsl:value-of select="' '"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$power=1">
								<xsl:value-of select="concat('тысяч',$ret2)"/>
							</xsl:when>
							<xsl:when test="$power=2">
								<xsl:value-of select="concat('миллион',$ret2)"/>
							</xsl:when>
							<xsl:when test="$power=3">
								<xsl:value-of select="concat('миллиард',$ret2)"/>
							</xsl:when>
							<xsl:when test="$power=4">
								<xsl:value-of select="concat('триллион',$ret2)"/>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>

			</xsl:if>
		</xsl:variable>

		<xsl:variable name="str">
			<xsl:if test="$value > 999">
				<xsl:variable name="vd1" select="floor($value div 1000)"/>
				<xsl:variable name="str">
					<xsl:call-template name="float2speech">
						<xsl:with-param name="value" select="$vd1"/>
						<xsl:with-param name="sex" select="$pp"/>
						<xsl:with-param name="power" select="$power+1"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="$str"/>
			</xsl:if>
		</xsl:variable>

		<xsl:variable name="ppp">
			<xsl:choose>
				<xsl:when test="$pp!=''">
					<xsl:value-of select="$pp"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'m'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="str2">
			<xsl:call-template name="int2speech">
				<xsl:with-param name="dig" select="number(substring($value,string-length($value)-2,3))"/>
				<xsl:with-param name="sex" select="$ppp"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:text> </xsl:text>
		<xsl:value-of select="concat(concat(translate(substring((normalize-space($str)),1,1),'абвгдежзиклмнопрстуфхцчшщъыьэюя','АБВГДЕЖЗИКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'),substring(normalize-space($str),2,string-length($str))),' ')"/>
		<xsl:value-of select="$str2"/>
		<xsl:value-of select="$strx"/>

	</xsl:template>

	<xsl:template name="int2speech">
		<xsl:param name="dig"/>
		<xsl:param name="sex"/>
		<xsl:variable name="remainder" select="floor(($dig mod 1000) div 100)"/>

		<xsl:variable name="ret">
			<xsl:choose>
				<xsl:when test="$remainder=1">
					<xsl:value-of select="'сто '"/>
				</xsl:when>
				<xsl:when test="$remainder=2">
					<xsl:value-of select="'двести '"/>
				</xsl:when>
				<xsl:when test="$remainder=3">
					<xsl:value-of select="'триста '"/>
				</xsl:when>
				<xsl:when test="$remainder=4">
					<xsl:value-of select="'четыреста '"/>
				</xsl:when>
				<xsl:when test="$remainder=5">
					<xsl:value-of select="'пятьсот '"/>
				</xsl:when>
				<xsl:when test="$remainder=6">
					<xsl:value-of select="'шестьсот '"/>
				</xsl:when>
				<xsl:when test="$remainder=7">
					<xsl:value-of select="'семьсот '"/>
				</xsl:when>
				<xsl:when test="$remainder=8">
					<xsl:value-of select="'восемьсот '"/>
				</xsl:when>
				<xsl:when test="$remainder=9">
					<xsl:value-of select="'девятьсот '"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="remainder2" select="floor(($dig mod 100) div 10)"/>
		<xsl:variable name="remainder3" select="floor($dig mod 10)"/>

		<xsl:variable name="ret2">
			<xsl:choose>
				<xsl:when test="$remainder2=1">
					<xsl:choose>
						<xsl:when test="$remainder3=0">
							<xsl:value-of select="'десять '"/>
						</xsl:when>
						<xsl:when test="$remainder3=1">
							<xsl:value-of select="'одиннадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=2">
							<xsl:value-of select="'двенадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=3">
							<xsl:value-of select="'тринадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=4">
							<xsl:value-of select="'четырнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=5">
							<xsl:value-of select="'пятнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=6">
							<xsl:value-of select="'шестнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=7">
							<xsl:value-of select="'семнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=8">
							<xsl:value-of select="'восемнадцать '"/>
						</xsl:when>
						<xsl:when test="$remainder3=9">
							<xsl:value-of select="'девятнадцать '"/>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$remainder2=2">
					<xsl:value-of select="'двадцать '"/>
				</xsl:when>
				<xsl:when test="$remainder2=3">
					<xsl:value-of select="'тридцать '"/>
				</xsl:when>
				<xsl:when test="$remainder2=4">
					<xsl:value-of select="'сорок '"/>
				</xsl:when>
				<xsl:when test="$remainder2=5">
					<xsl:value-of select="'пятьдесят '"/>
				</xsl:when>
				<xsl:when test="$remainder2=6">
					<xsl:value-of select="'шестьдесят '"/>
				</xsl:when>
				<xsl:when test="$remainder2=7">
					<xsl:value-of select="'семьдесят '"/>
				</xsl:when>
				<xsl:when test="$remainder2=8">
					<xsl:value-of select="'восемьдесят '"/>
				</xsl:when>
				<xsl:when test="$remainder2=9">
					<xsl:value-of select="'девяносто '"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="ret3">
			<xsl:choose>
				<xsl:when test="$remainder2!=1">
					<xsl:choose>
						<xsl:when test="$remainder3=1">
							<xsl:choose>
								<xsl:when test="$sex='f'">
									<xsl:value-of select="'одна '"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'один '"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$remainder3=2">
							<xsl:choose>
								<xsl:when test="$sex='f'">
									<xsl:value-of select="'две '"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'два '"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$remainder3=3">
							<xsl:value-of select="'три '"/>
						</xsl:when>
						<xsl:when test="$remainder3=4">
							<xsl:value-of select="'четыре '"/>
						</xsl:when>
						<xsl:when test="$remainder3=5">
							<xsl:value-of select="'пять '"/>
						</xsl:when>
						<xsl:when test="$remainder3=6">
							<xsl:value-of select="'шесть '"/>
						</xsl:when>
						<xsl:when test="$remainder3=7">
							<xsl:value-of select="'семь '"/>
						</xsl:when>
						<xsl:when test="$remainder3=8">
							<xsl:value-of select="'восемь '"/>
						</xsl:when>
						<xsl:when test="$remainder3=9">
							<xsl:value-of select="'девять '"/>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="concat($ret,$ret2,$ret3)"/>

	</xsl:template>

	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
