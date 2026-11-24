<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС от 02.08.2023 г. N 660 "Об утверждении формы заявления о вывозе товаров, помещенных под таможенную процедуру свободной таможенной зоны, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, для собственных производственных и технологических нужд и формы разрешения таможенного органа на такой вывоз"-->
<!--Приказ ФТС от 26.09.2023 г. N 855 "Об утверждении перечня сведений, указываемых в заявлении о вывозе декларируемых товаров с участка территории свободной экономической зоны, на котором применяется таможенная процедура свободной таможенной зоны, на остальную часть территории свободной экономической зоны на территориях Республики Крым и города федерального значения Севастополя для собственных производственных и технологических нужд, формы такого заявления и формы решения таможенного органа о вывозе товаров для собственных производственных и технологических нужд"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:peg="urn:customs.ru:Information:ExchangeDocuments:STZ_PermitExportGoods:5.28.0">
	
	<xsl:variable name="DocKind" select="peg:STZ_PermitExportGoods/peg:DocKind"/>
	
	<xsl:template match="peg:STZ_PermitExportGoods">
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



                  .bordered { border-collapse: collapse;}
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  .font10{
					  font-size: 9pt;
                  }
                </style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="$DocKind = 1">
						<div class="page" style="width: {$w}mm;">
							<table>
								<tbody>
									<tr valign="top">
										<td width="49%">
											Отметка таможенного органа
											<table>
												<tbody>
													<tr valign="top">
														<td class="bordered">
															<xsl:text>Регистрационный № </xsl:text>
															<table style="display: inline-block; width: 25mm;">
																<tbody>
																	<tr>
																		<td align="center">
																			<xsl:apply-templates select="peg:PermissionRegNumber/peg:CustomsCode"/>
																		</td>
																	</tr>
																	<tr align="center" valign="top">
																		<td style="font-size: 8pt; border-top: 1px solid black;">
																			<xsl:text>(код таможенного органа)</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
															<xsl:text>/</xsl:text>
															<table style="display: inline-block; width: 25mm;">
																<tbody>
																	<tr>
																		<td align="center">
																			<xsl:apply-templates select="peg:PermissionRegNumber/peg:RegistrationDate" mode="num_date"/>
																		</td>
																	</tr>
																	<tr align="center" valign="top">
																		<td style="font-size: 8pt; border-top: 1px solid black;">
																			<xsl:text>(день, месяц, год)</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
															<xsl:text>/</xsl:text>
															<table style="display: inline-block; width: 25mm;">
																<tbody>
																	<tr>
																		<td align="center">
																			<xsl:apply-templates select="peg:PermissionRegNumber/peg:Number"/>
																		</td>
																	</tr>
																	<tr align="center" valign="top">
																		<td style="font-size: 8pt; border-top: 1px solid black;">
																			<xsl:text>(порядковый номер)</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
															<xsl:text>/РСПН</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="2%"></td>
										<td width="49%">
											<table>
												<tbody>
													<tr>
														<td>
															<!--xsl:text>От </xsl:text-->
															<xsl:apply-templates select="peg:AppCloseSTZ/peg:Resident"/>
														</td>
													</tr>
													<tr>
														<td align="justify" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
															(резидент территории опережающего развития, свободного порта Владивосток (далее - резидент (наименование организации, содеражащее указание на ее организационно-правовую форму, 
															идентификационный номер налогоплательщика (ИНН), адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), 
															адрес, по которому постоянно проживает или зарегистрировано физическое лицо, идентификационный номер налогоплательщика (ИНН), сведения о документе, удостоверяющем личность физического лица - для физического лица; 
															реквизиты свидетельства, удостоверяющего регистрацию лица в качестве резидента территории опережающего развития или свободного порта Владивосток)
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
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												Разрешение таможенного органа на вывоз товаров,<br/>
												помещенных под таможенную процедуру свободной таможенной зоны,<br/>
												и (или) товаров, изготовленных (полученных) из товаров,<br/>
												помещенных под таможенную процеруду свободной таможенной зоны,<br/>
												для собственных производственных и технологических нужд
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<p style="text-indent: 5mm;">
								Настоящим разрешается вывоз товаров, указанных в части 3 статьи 25<sup>5</sup> Федерального закона от 29 декабря 2014 г. № 473-ФЗ "О территориях опережающего экономического развития в Российской Федерации" и части 2 статьи 26<sup>2</sup> Федерального закона от 13 июля 2015 г. № 212-ФЗ "О свободном порте Владивосток", 
								для собственных производственных и технологических нужд на основании подпункта 4 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза<sup>1</sup> с территории опережающего развития (свободного порта Владивосток)
								<table style="table-layout: fixed; width: 100%">
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="peg:AppCloseSTZ/peg:AddressOfTerritory" mode="address"/>
											</td>
										</tr>
										<tr align="center">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(место нахождения участка резидента с указанием адреса)
											</td>
										</tr>
									</tbody>
								</table>
							</p>
							<br/>
							<br/>
							<p style="text-indent: 5mm;">
								Таблица 1. Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны (далее - товары)
							</p>
							<table style="table-layout: fixed; width: 100%">
								<tbody>
									<tr align="center" valign="top">
										<td class="bordered font10" width="5%">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС)</td>
										<td class="bordered font10">Идентификационные признаки товара</td>
										<td class="bordered font10">Количество товара</td>
										<td class="bordered font10">Единица измерения</td>
										<td class="bordered font10">Регистрационный номер декларации на товары</td>
										<td class="bordered font10">Номер товара в декларации на товары</td>
										<td class="bordered font10">Примечание</td>
									</tr>
									<tr>
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
										<td class="bordered font10">8</td>
										<td class="bordered font10">9</td>
									</tr>
									<xsl:for-each select="peg:AppCloseSTZ/peg:STZ_Goods">
										<tr>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsIdentification"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="peg:DeclRegNum" mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:for-each select="peg:GoodsDeclnfo/peg:GoodsNumber">
														<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:Decision"/>
												<xsl:if test="peg:RejectionReason">
													<br/>
													<xsl:apply-templates select="peg:RejectionReason"/>
												</xsl:if>
												<xsl:if test="peg:GoodsStatus">
													<br/>
													<xsl:apply-templates select="peg:GoodsStatus"/>
												</xsl:if>
												
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<br/>
							<p style="text-indent: 5mm;">
								Таблица 2. Сведения о товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны (далее - готовая продукция)
							</p>
							<table style="table-layout: fixed; width: 100%">
								<tbody>
									<tr align="center" valign="top">
										<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
										<td class="bordered font10" rowspan="2">Наименование готовой продукции</td>
										<td class="bordered font10" rowspan="2">Классификационный код готовой продукции ТН ВЭД ЕАЭС / стоимость</td>
										<td class="bordered font10" rowspan="2">Идентификационные признаки готовой продукции</td>
										<td class="bordered font10" rowspan="2">Количество готовой продукции</td>
										<td class="bordered font10" rowspan="2">Единица измерения</td>
										<td class="bordered font10" colspan="2">Документ бухгалтерского учета, согласно которому готовая продукция учтена резидентом</td>
										<td class="bordered font10" rowspan="2">Примечание</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">наименование</td>
										<td class="bordered font10">номер/дата</td>
									</tr>
									<tr align="center">
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
										<td class="bordered font10">8</td>
										<td class="bordered font10">9</td>
									</tr>
									<xsl:for-each select="peg:AppCloseSTZ/peg:FinishedProducts">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="peg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsTNVEDCode"/>
												<xsl:if test="peg:Cost">
													<xsl:text> / </xsl:text>
													<xsl:apply-templates select="peg:Cost"/>
												</xsl:if>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsIdentification"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="peg:CustomsDoc/cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="peg:CustomsDoc/cat_ru:PrDocumentNumber"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="peg:CustomsDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:Decision"/>
												<xsl:if test="peg:RejectionReason">
													<br/>
													<xsl:apply-templates select="peg:RejectionReason"/>
												</xsl:if>
												<xsl:if test="peg:GoodsStatus">
													<br/>
													<xsl:apply-templates select="peg:GoodsStatus"/>
												</xsl:if>
												<xsl:if test="peg:Comments">
													<br/>
													<xsl:apply-templates select="peg:Comments"/>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<p style="text-indent: 5mm;">
								Цели вывоза и использования товаров и (или) готовой продукции для собственных производственных и технологических нужд в соответствии с видами деятельности, 
								предусмотренными соглашением  об осуществлении деятельности на территории опережающего развития (свободного порта Владивосток)<br/>
								<xsl:apply-templates select="peg:AppCloseSTZ/peg:PurposeOfExport"/>
							</p>
							<br/>
							<p style="text-indent: 5mm;">
								Место вывоза товаров
								<table style="table-layout: fixed; width: 100%">
									<tbody>
										<tr>
											<td>
												<xsl:for-each select="peg:AppCloseSTZ/peg:PlaceOfExport/*">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:choose>
														<xsl:when test="local-name() = 'PlaceAddress'">
															<xsl:text> адрес: </xsl:text>
															<xsl:apply-templates select="." mode="address"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</td>
										</tr>
										<tr align="center">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(часть территории Российской Федерации, включенная в перечень территорий государств - членов Евразийского экономического союза, 
												на которые из свободных (специальных, особоых) экономических зон допускается вывоз товаров и (или) готовой продукции<sup>3</sup>, 
												наименование объекта, адрес)
											</td>
										</tr>
									</tbody>
								</table>
							</p>
							<br/>
							<p style="text-indent: 5mm;">
								Срок вывоза товаров: <xsl:apply-templates select="peg:AppCloseSTZ/peg:ExportDate" mode="russian_date"/>
							</p>
							<br/>
							<br/>
							<table style="table-layout: fixed; width: 200mm;">
								<tbody>
									<tr valign="bottom">
										<td width="70%">
											<xsl:apply-templates select="peg:CustomsSignature/cat_ru:PersonPost"/>
											<br/>
											<xsl:if test="peg:CustomsSignature/cat_ru:PersonName">
												<xsl:value-of select="substring(peg:CustomsSignature/cat_ru:PersonName, 1, 1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:if test="peg:CustomsSignature/cat_ru:PersonMiddleName">
												<xsl:value-of select="substring(peg:CustomsSignature/cat_ru:PersonMiddleName, 1, 1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="peg:CustomsSignature/cat_ru:PersonSurname"/>
										</td>
										<td width="5%"></td>
										<td width="25%"></td>
									</tr>
									<tr align="center" valign="top">
										<td style="font-size: 8pt; border-top: 1px solid black;">
											(должность, инициалы и фамилия должностного лица таможенного органа)
										</td>
										<td></td>
										<td style="font-size: 8pt; border-top: 1px solid black;">
											(подпись)
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="$DocKind = 2">
						<div class="page" style="width: {$w}mm;">
							<table>
								<tbody>
									<tr valign="top">
										<td width="49%">
											Отметка таможенного органа
											<table>
												<tbody>
													<tr valign="top">
														<td class="bordered">
															<xsl:text>Регистрационный № </xsl:text>
															<table style="display: inline-block; width: 25mm;">
																<tbody>
																	<tr>
																		<td align="center">
																			<xsl:apply-templates select="peg:PermissionRegNumber/peg:CustomsCode"/>
																		</td>
																	</tr>
																	<tr align="center" valign="top">
																		<td style="font-size: 8pt; border-top: 1px solid black;">
																			<xsl:text>(код таможенного органа)</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
															<xsl:text>/</xsl:text>
															<table style="display: inline-block; width: 25mm;">
																<tbody>
																	<tr>
																		<td align="center">
																			<xsl:apply-templates select="peg:PermissionRegNumber/peg:RegistrationDate" mode="num_date"/>
																		</td>
																	</tr>
																	<tr align="center" valign="top">
																		<td style="font-size: 8pt; border-top: 1px solid black;">
																			<xsl:text>(день, месяц, год)</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
															<xsl:text>/</xsl:text>
															<table style="display: inline-block; width: 25mm;">
																<tbody>
																	<tr>
																		<td align="center">
																			<xsl:apply-templates select="peg:PermissionRegNumber/peg:Number"/>
																		</td>
																	</tr>
																	<tr align="center" valign="top">
																		<td style="font-size: 8pt; border-top: 1px solid black;">
																			<xsl:text>(порядковый номер)</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
															<xsl:text>/РСПН</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="2%"></td>
										<td width="49%">
											<table>
												<tbody>
													<tr>
														<td>
															<!--xsl:text>От </xsl:text-->
															<xsl:apply-templates select="peg:AppCloseSTZ/peg:Resident"/>
														</td>
													</tr>
													<tr>
														<td align="justify" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
															(участник свободной экономической зоны, или лицо, которому переданы права владения, пользования и (или) распоряжения товарами (далее - Заявитель) 
															(наименование огранизации, содержащее указание на ее организационно правовую форму (полное или сокращенное наименование, если наименование предусмотрено 
															учредительным документом юридического лица), идентификционный номер налогоплательщика (далее - ИНН), адрес юридического лица в пределах его места нахождения - 
															для юридического лица; фамилия, имя, отчество при наличии, адрес регистрации по месту жительства или по месту пребывания физического лица, ИНН и сведения о документе, 
															удостоверяющем личность физического лица - для физического лица; регистрационный номер свидетельства о включении юридического лица, индивидуального предпринимателя 
															в единый реестр участников свободной экономической зоны)
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
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												Решение<br/>
												таможенного органа о вывозе товаров,<br/>
												указанных в части 17<sup>1</sup> статьи 18 Федерального закона<br/>
												от 29 ноября 2014 г. № 377-ФЗ "О развитии Республики Крым<br/>
												и города федерального значения Севастополя и свободной экономической зоне<br/>
												на территориях Республики Крым и города федерального значения Севастополя",<br/>
												для собственных производственных и технологических нужд
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<p style="text-indent: 5mm;">
								1. Настоящим разрешается вывоз товаров для собственных производственных и технологических нужд в соответствии с частью 17<sup>1</sup> статьи 18 Федерального закона от  29 ноября 2014 г. 
								№ 377-ФЗ ""О развитии Республики Крым и города федерального значения Севастополя и свободной экономической зоне на территориях Республики Крым и города федерального значения Севастополя" 
								<sup>1</sup> по заявлению № 
								<xsl:apply-templates select="peg:AppRegNum"/> 
								с территории участка участника свободной экономической зоны<sup>2</sup> или лица, которому переданы права владения, пользования и (или) распоряжения товарами
								<table style="table-layout: fixed; width: 100%">
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="peg:AppCloseSTZ/peg:AddressOfTerritory" mode="address"/>
											</td>
										</tr>
										<tr align="center">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(место нахождения участка и адрес его местонахождения)
											</td>
										</tr>
									</tbody>
								</table>
							</p>
							<br/>
							<br/>
							<p style="text-indent: 5mm;">
								2. Сведения о товарах, вывозимых для собственных производственных и технологических нужд
							</p>
							<p style="text-indent: 5mm;">
								Таблица 1. Сведения о товарах,
								<table style="display: inline-block; table-layout: fixed; width: 150mm;">
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="peg:AppCloseSTZ/peg:GoodsKind"/>
											</td>
										</tr>
										<tr align="center">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(которые при таможенном декларировании были заявлены как предназначенные для собственных производственных и технологических нужд /
												не были заявлены как предназначенные для собственных производственных и технологических нужд)
											</td>
										</tr>
									</tbody>
								</table>
							</p>
							<table style="table-layout: fixed; width: 100%">
								<tbody>
									<tr align="center" valign="top">
										<td class="bordered font10" width="5%">№ п/п</td>
										<td class="bordered font10">Наименование товара</td>
										<td class="bordered font10">Классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза (далее - ТН ВЭД ЕАЭС)</td>
										<td class="bordered font10">Идентификационные признаки товара (товарный знак, марка, модель, артикул, сорт, стандарт,  технические и количественные характеристики товара)</td>
										<td class="bordered font10">Количество товара</td>
										<td class="bordered font10">Количество товара в дополнительной единице измерения / дополнительная единица измерения</td>
										<td class="bordered font10">Регистрационный номер декларации на товары</td>
										<td class="bordered font10">Порядковый номер товара в декларации на товары</td>
									</tr>
									<tr align="center">
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
										<td class="bordered font10">8</td>
									</tr>
									<xsl:for-each select="peg:AppCloseSTZ/peg:STZ_Goods">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="peg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsTNVEDCode"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsIdentification"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsWeightQuantity"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="peg:DeclRegNum" mode="reg_num"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:for-each select="peg:GoodsDeclnfo/peg:GoodsNumber">
														<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<br/>
							<p style="text-indent: 5mm;">
								Таблица 2. Сведения о товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны (далее - готовая продукция)
							</p>
							<table style="table-layout: fixed; width: 100%">
								<tbody>
									<tr align="center" valign="top">
										<td class="bordered font10" rowspan="2" width="5%">№ п/п</td>
										<td class="bordered font10" rowspan="2">Наименование готовой продукции</td>
										<td class="bordered font10" rowspan="2">Классификационный код готовой продукции ТН ВЭД ЕАЭС / стоимость</td>
										<td class="bordered font10" rowspan="2">Идентификационные признаки готовой продукции (товарный знак, марка, модель, артикул, сорт, стандарт,  технические и количественные характеристики товара)</td>
										<td class="bordered font10" rowspan="2">Количество готовой продукции, кг</td>
										<td class="bordered font10" rowspan="2">Количество готовой продукции в дополнительной единице измерения/ дополнительная единица измерения</td>
										<td class="bordered font10" colspan="3">Документ бухгалтерского учета, согласно которому готовая продукция учтена Заявителем</td>
									</tr>
									<tr align="center" valign="top">
										<td class="bordered font10">наименование</td>
										<td class="bordered font10">номер</td>
										<td class="bordered font10">дата</td>
									</tr>
									<tr align="center">
										<td class="bordered font10">1</td>
										<td class="bordered font10">2</td>
										<td class="bordered font10">3</td>
										<td class="bordered font10">4</td>
										<td class="bordered font10">5</td>
										<td class="bordered font10">6</td>
										<td class="bordered font10">7</td>
										<td class="bordered font10">8</td>
										<td class="bordered font10">9</td>
									</tr>
									<xsl:for-each select="peg:AppCloseSTZ/peg:FinishedProducts">
										<tr valign="top">
											<td class="bordered font10">
												<xsl:apply-templates select="peg:Position"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsDescription"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsTNVEDCode"/>
												<xsl:if test="peg:Cost">
													<xsl:text> / </xsl:text>
													<xsl:apply-templates select="peg:Cost"/>
												</xsl:if>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsIdentification"/>
											</td>
											<td class="bordered font10">
												<xsl:apply-templates select="peg:GoodsWeightQuantity"/>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:GoodsQuantity">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="peg:CustomsDoc/cat_ru:PrDocumentName"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="peg:CustomsDoc/cat_ru:PrDocumentNumber"/>
												</xsl:for-each>
											</td>
											<td class="bordered font10">
												<xsl:for-each select="peg:PropertyGoodsDecl">
													<xsl:if test="position() != 1"><br/></xsl:if>
													<xsl:apply-templates select="peg:CustomsDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
							<p style="text-indent: 5mm;">
								Цель вывоза и использования товаров для собственных производственных и технологических нужд (в соответствии с видом деятельности, 
								предусмотренным договором об условиях деятельности в свободной экономической зоне, если товары вывозятся участником свободной экономической зоны):<br/>
								<xsl:apply-templates select="peg:AppCloseSTZ/peg:PurposeOfExport"/>
							</p>
							<br/>
							<p style="text-indent: 5mm;">
								Место вывоза товаров, размещения и использования товаров
								<table style="table-layout: fixed; width: 100%">
									<tbody>
										<tr>
											<td>
												<xsl:for-each select="peg:AppCloseSTZ/peg:PlaceOfExport/*">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:choose>
														<xsl:when test="local-name() = 'PlaceAddress'">
															<xsl:text> адрес: </xsl:text>
															<xsl:apply-templates select="." mode="address"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</td>
										</tr>
										<tr align="center">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(часть территории свободной экономической зоны, наименование объекта (при наличии), адрес (при наличии)
											</td>
										</tr>
									</tbody>
								</table>
							</p>
							<br/>
							<br/>
							<table style="table-layout: fixed; width: 200mm;">
								<tbody>
									<tr valign="bottom">
										<td width="70%">
											<xsl:apply-templates select="peg:CustomsSignature/cat_ru:PersonPost"/>
											<br/>
											<xsl:if test="peg:CustomsSignature/cat_ru:PersonName">
												<xsl:value-of select="substring(peg:CustomsSignature/cat_ru:PersonName, 1, 1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:if test="peg:CustomsSignature/cat_ru:PersonMiddleName">
												<xsl:value-of select="substring(peg:CustomsSignature/cat_ru:PersonMiddleName, 1, 1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="peg:CustomsSignature/cat_ru:PersonSurname"/>
										</td>
										<td width="5%"></td>
										<td width="25%"></td>
									</tr>
									<tr align="center" valign="top">
										<td style="font-size: 8pt; border-top: 1px solid black;">
											(должность, инициалы и фамилия должностного лица таможенного органа)
										</td>
										<td></td>
										<td style="font-size: 8pt; border-top: 1px solid black;">
											(подпись)
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
				</xsl:choose>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="peg:GoodsKind">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">
					<xsl:text>которые при таможенном декларировании были заявлены как предназначенные для собственных производственных и технологических нужд</xsl:text>
				</xsl:when>
				<xsl:when test=". = 2">
					<xsl:text>которые при таможенном декларировании не были заявлены как предназначенные для собственных производственных и технологических нужд</xsl:text>
				</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="peg:AppRegNum">
		<xsl:apply-templates select="." mode="reg_num"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="peg:AddNumber"/>
	</xsl:template>
	
	<xsl:template match="peg:Decision">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">
					<xsl:text>разрешено</xsl:text>
				</xsl:when>
				<xsl:when test=". = 2">
					<xsl:text>отказано</xsl:text>
				</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="peg:GoodsStatus">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">
					<xsl:text>товар ЕАЭС</xsl:text>
				</xsl:when>
				<xsl:when test=". = 2">
					<xsl:text>иностранный товар</xsl:text>
				</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="peg:Resident">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'PersonId' or local-name() = 'IdentityCard']">
				<!-- считаем, что это ФЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<!--xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN and $DocKind = 1">
					<xsl:text>, ОГРНИП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if-->
				<xsl:if test="RUScat_ru:IdentityCard">
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identityCard"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- ЮЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<!--xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP and $DocKind = 1">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if-->
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$DocKind = 1">
			<xsl:apply-templates select="peg:ResidentCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="peg:ResidentCertificate">
		<xsl:text>, свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="peg:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="peg:CertificateDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="identityCard">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> выдан </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:if test="position() != 1">; </xsl:if>
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
	
	<xsl:template match="peg:GoodsIdentification">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="peg:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:Code"/>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber' or local-name() = 'Number']"/>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text>№ </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
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
	<xsl:template name="num_date">
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
	<xsl:template match="//*[local-name()='STZ_PermitExportGoods']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
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
