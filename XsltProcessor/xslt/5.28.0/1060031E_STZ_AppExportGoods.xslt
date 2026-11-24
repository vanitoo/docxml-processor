<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:aeg="urn:customs.ru:Information:ExchangeDocuments:STZ_AppExportGoods:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<xsl:variable name="DocKind" select="aeg:STZ_AppExportGoods/aeg:DocKind"/>
	<!-- Шаблон для типа STZ_AppExportGoodsType -->
	<xsl:template match="aeg:STZ_AppExportGoods">
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
																<td></td>
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
																<td></td>
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
																<td></td>
															</tr>
															<tr align="center" valign="top">
																<td style="font-size: 8pt; border-top: 1px solid black;">
																	<xsl:text>(порядковый номер)</xsl:text>
																</td>
															</tr>
														</tbody>
													</table>
													<xsl:text>/</xsl:text>
													<xsl:choose>
														<xsl:when test="$DocKind = 1 or $DocKind = 2">ЗСПН</xsl:when>
														<xsl:when test="$DocKind = 3">ЗЗПО</xsl:when>
													</xsl:choose>
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
													<xsl:text>В </xsl:text>
													<xsl:apply-templates select="aeg:Customs"/>
												</td>
											</tr>
											<tr>
												<td align="center" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													<xsl:choose>
														<xsl:when test="$DocKind = 1 or $DocKind = 2">
															(наименование таможенного органа и код таможенного органа)
														</xsl:when>
														<xsl:when test="$DocKind = 3">
															(наименование и код таможенного органа)
														</xsl:when>
													</xsl:choose>
													
												</td>
											</tr>
											<tr>
												<td>
													<xsl:text>От </xsl:text>
													<xsl:apply-templates select="aeg:Resident"/>
												</td>
											</tr>
											<tr>
												<td align="justify" valign="top" style="font-size: 8pt; border-top: 1px solid black;">
													<xsl:choose>
														<xsl:when test="$DocKind = 1">
															(резидент территории опережающего развития, свободного порта Владивосток (далее - резидент) (наименование организации, содержащее указание на ее организационно правовую форму (сокращенное наименование, если такое наименование предусмотрено учредительным документом юридического лица), основной государственный регистрационный номер (ОГРН), идентификацинный номер налогоплательщика (инн) и код причины постановки на учет в налоговом органе (кпп), присвоенные юридическому лицу в соответствии с законодательством Российской Федерации, адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес, по которому постоянно проживает или зарегстрировано физическое лицо, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя (ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица; реквизиты свидетельства, удостоверяющего регистрацию лица в качестве резидента территории опережающего развития или свободного порта Владивосток)
														</xsl:when>
														<xsl:when test="$DocKind = 2">
															(участник свободной экономической зоны или лицо, которому переданы права владения, пользования и (или) распоряжения товарами (далее - Заявитель) (наименование организации, содержащее указание на ее организационно правовую форму (сокращенное наименование, если такое наименование предусмотрено учредительным документом юридического лица), основной государственный регистрационный номер (ОГРН), идентификацинный номер налогоплательщика (инн) и код причины постановки на учет в налоговом органе (кпп), присвоенные юридическому лицу в соответствии с законодательством Российской Федерации, адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес, по которому постоянно проживает или зарегстрировано физическое лицо, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя (ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица; регистрационный номер свидетельства о включении юридического лица, индивидуального предпринимателя в единый реестр участников свободной экономической зоны)
														</xsl:when>
														<xsl:when test="$DocKind = 3">
															(участник Особой экономической зоны (далее - участник) (полное наименование организации, содержащее указание на ее организационно правовую форму (сокращенное наименование, если такое наименование предусмотрено учредительным документом юридического лица), основной государственный регистрационный номер (ОГРН), идентификацинный номер налогоплательщика (инн) и код причины постановки на учет в налоговом органе (кпп), присвоенные юридическому лицу в соответствии с законодательством Российской Федерации, адрес юридического лица в пределах его места нахождения - для юридического лица; фамилия, имя, отчество (при наличии), адрес, по которому постоянно проживает или зарегстрировано физическое лицо, идентификационный номер налогоплательщика (ИНН), основной государственный регистрационный номер индивидуального предпринимателя (ОГРНИП) и сведения о документе, удостоверяющем личность физического лица - для физического лица; реквизиты регистрационного свидетельства, подтверждающего получение статуса участника)
														</xsl:when>
													</xsl:choose>
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
										<xsl:text>Заявление</xsl:text><br/>
										<xsl:choose>
											<xsl:when test="$DocKind = 1">
												о вывозе товаров, помещенных<br/>под таможенную процедуру свободной таможенной зоны,<br/>и (или) товаров, изготовленных (полученных) из товаров,<br/>помещенных под таможенную процедуру свободной таможенной зоны,<br/>для собственных производственных и технологических нужд
											</xsl:when>
											<xsl:when test="$DocKind = 2">
												о вывозе декларируемых товаров, указанных в части 17<sup>1</sup><br/>статьи 18 Федерального закона от 29 ноября 2014 г. №377-ФЗ<br/>"О развитии Республики Крым и города федерального значения<br/>Севастополя и свободной экономической зоне на территориях<br/>Республики Крым и города федерального значения Севастополя",<br/>участником свободной экономической зоны на остальную часть<br/>территории свободной экономической зоны для собственных<br/>производственных и технологических нужд
											</xsl:when>
											<xsl:when test="$DocKind = 3">
												о вывозе декларируемых товаров, помещенных<br/>под таможенную процедуру свободной таможенной зоны,<br/>на остальную часть территории Магаданской области<br/>для собственных производственных и технологических<br/>нужд без завершения таможенной процедуры<br/>свободной таможенной зоны
											</xsl:when>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-indent: 5mm;">
						<xsl:choose>
							<xsl:when test="$DocKind = 1">
								<xsl:text>Прошу разрешить вывоз товаров для собственных производственных и технологических нужд на основании подпункта 4 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза</xsl:text><sup>1</sup>
								<xsl:text> в отношении товаров согласно представленным ниже сведениям на </xsl:text>
								<span style="display: inline-block; width: 15mm; border-bottom: 1px solid black; text-align: center;">
									<xsl:apply-templates select="aeg:SheetsNumber"/>
								</span>
								<xsl:text> л. с территории участника территории опережающего развития (свободного порта Владивосток)</xsl:text>
								<table>
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="aeg:AddressOfTerritory" mode="address"/>
											</td>
										</tr>
										<tr>
											<td align="center" style="font-size: 8pt;border-top: 1px solid black;">
												(наименование территории опережающего развития, свободного порта Владивосток (с указанием места нахождения участка резидента (адрес)
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:when>
							<xsl:when test="$DocKind = 2">
								<xsl:text>Прошу разрешить вывоз товаров для собственных производственных и технологических нужд на основании части 17</xsl:text><sup>1</sup>
								<xsl:text>статьи 18 Федерального закона от 29 ноября 2014 года № 377-ФЗ "О развитии Республики Крым и города федерального значения Севастополя и свободной экономической зоне на  территориях Республики Крым и города федерального значения Севастополя"</xsl:text>
								<sup>1</sup>
								<xsl:text> согласно представленным ниже сведениям на </xsl:text>
								<span style="display: inline-block; width: 15mm; border-bottom: 1px solid black; text-align: center;">
									<xsl:apply-templates select="aeg:SheetsNumber"/>
								</span>
								<xsl:text> л. с территории участка участника свободного экономической зоны</xsl:text>
								<sup>2</sup>
								<xsl:text> (лица, которому переданы права владения, пользования и (или) распоряжения товарами)</xsl:text>
								<table>
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="aeg:AddressOfTerritory" mode="address"/>
											</td>
										</tr>
										<tr>
											<td align="center" style="font-size: 8pt;border-top: 1px solid black;">
												(место нахождения участка и адрес в пределах его местенахождения)
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:when>
							<xsl:when test="$DocKind = 3">
								<xsl:text>Прошу разрешить вывоз товаров, помещенных под таможенную процедуру свободной таможенной зоны, для собственных производственных и технологических нужд в соответствии с пунктом 7 статьи 455 Таможенного кодекса Евразийского экономического союза</xsl:text><sup>1</sup>
								<xsl:text>без завершения таможенной процедуры свободной таможенной зоны согласно представленным ниже сведениям на </xsl:text>
								<span style="display: inline-block; width: 15mm; border-bottom: 1px solid black; text-align: center;">
									<xsl:apply-templates select="aeg:SheetsNumber"/>
								</span>
								<xsl:text> л. с территории Особой экономической зоны, функционируюдей в г.Магадане (в его административных границах), на остальную часть территории Магаданской области.</xsl:text>
							</xsl:when>
						</xsl:choose>
					</p>
					
					<!-- Таблица 1 -->
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:choose>
										<xsl:when test="$DocKind = 1">
											Таблица 1. Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны
											<table>
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered">№ п/п</td>
														<td class="bordered">Наименование товара</td>
														<td class="bordered">Классификацианный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза<sup>2</sup> (далее - ТН ВЭД ЕАЭС)</td>
														<td class="bordered">Идентификационные признаки товара (тип, марка, модель, артикул, технические и качественные характеристики товара</td>
														<td class="bordered">Количество товара, в кг</td>
														<td class="bordered">Количество товара / дополнительная единица измерения</td>
														<td class="bordered">Регистрационный номер декларации на товары</td>
														<td class="bordered">Номер товара в декларации на товары</td>
														<td class="bordered">Статус товара</td>
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
													</tr>
													<xsl:apply-templates select="aeg:STZ_Goods" mode="DocKind1_table1"/>
												</tbody>
											</table>
										</xsl:when>
										<xsl:when test="$DocKind = 2">
											Таблица 1. Сведения о товарах,
											<table style="display: inline-block; table-layout: fixed; width: 150mm;">
												<tbody>
													<tr>
														<td>
															<xsl:apply-templates select="aeg:GoodsKind"/>
														</td>
													</tr>
													<tr align="center">
														<td style="font-size: 8pt; border-top: 1px solid black;">
															(декларируемых в соответствии с таможенной процедурой своободной таможенной зоны/помещенных под таможенную процедуру свободной таможенной зоны)
														</td>
													</tr>
												</tbody>
											</table>
											<table>
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered">№ п/п</td>
														<td class="bordered">Наименование товара</td>
														<td class="bordered">Классификацианный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза<sup>2</sup> (далее - ТН ВЭД ЕАЭС)</td>
														<td class="bordered">Идентификационные признаки товара (тип, марка, модель, артикул, технические и качественные характеристики товара</td>
														<td class="bordered">Количество товара, в кг</td>
														<td class="bordered">Количество товара / дополнительная единица измерения</td>
														<td class="bordered">Регистрационный номер декларации на товары</td>
														<td class="bordered">Номер товара в декларации на товары</td>
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
													</tr>
													<xsl:apply-templates select="aeg:STZ_Goods" mode="DocKind2_table1"/>
												</tbody>
											</table>
										</xsl:when>
										<xsl:when test="$DocKind = 3">
											Таблица 1. Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны
											<table>
												<tbody>
													<tr valign="top" align="center">
														<td class="bordered">№ п/п</td>
														<td class="bordered">Наименование товара</td>
														<td class="bordered">Классификацианный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза<sup>2</sup> (далее - ТН ВЭД ЕАЭС)</td>
														<td class="bordered">Идентификационные признаки товара (тип, марка, модель, артикул, технические и качественные характеристики товара</td>
														<td class="bordered">Количество товара, в кг</td>
														<td class="bordered">Количество товара / дополнительная единица измерения</td>
														<td class="bordered">Номер товара в декларации на товары</td>
													</tr>
													<tr align="center">
														<td class="bordered">1</td>
														<td class="bordered">2</td>
														<td class="bordered">3</td>
														<td class="bordered">4</td>
														<td class="bordered">5</td>
														<td class="bordered">6</td>
														<td class="bordered">7</td>
													</tr>
													<xsl:apply-templates select="aeg:STZ_Goods" mode="DocKind2_table1"/>
												</tbody>
											</table>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</table>
				
					<xsl:if test="$DocKind = 1 or $DocKind = 2">
						<br/>
						<br/>
						<!-- Таблица 2 -->
						<table>
							<tbody>
								<tr>
									<td>
										Таблица 2. Сведения о товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны (далее - готовая продукция)
										<xsl:choose>
											<xsl:when test="$DocKind = 1">
												<table>
													<tbody>
														<tr valign="top" align="center">
															<td class="bordered" rowspan="2">№ п/п</td>
															<td class="bordered" rowspan="2">Наименование готовой продукции</td>
															<td class="bordered" rowspan="2">Классификацианный код готовой продукции в соответствии с ТН ВЭД ЕАЭС / Стоимость</td>
															<td class="bordered" rowspan="2">Идентификационные признаки готовой продукции (тип, марка, модель, артикул, технические и качественные характеристики товара</td>
															<td class="bordered" rowspan="2">Количество готовой продукции, в кг</td>
															<td class="bordered" rowspan="2">Количество готовой продукции / дополнительная единица измерения</td>
															<td class="bordered" colspan="2">Документ бухгалтерского учета, согласно которому готовая продукция учтена резидентом</td>
															<td class="bordered" rowspan="2">Статус готовой продукции</td>
														</tr>
														<tr valign="top" align="center">
															<td class="bordered">наименование</td>
															<td class="bordered">номер/дата</td>
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
														</tr>
														<xsl:apply-templates select="aeg:FinishedProducts" mode="DocKind1_table2"/>
													</tbody>
												</table>
											</xsl:when>
											<xsl:when test="$DocKind = 2">
												<table>
													<tbody>
														<tr valign="top" align="center">
															<td class="bordered" rowspan="2">№ п/п</td>
															<td class="bordered" rowspan="2">Наименование готовой продукции</td>
															<td class="bordered" rowspan="2">Классификацианный код готовой продукции в соответствии с ТН ВЭД ЕАЭС / Стоимость</td>
															<td class="bordered" rowspan="2">Идентификационные признаки готовой продукции (тип, марка, модель, артикул, технические и качественные характеристики товара</td>
															<td class="bordered" rowspan="2">Количество готовой продукции, в кг</td>
															<td class="bordered" rowspan="2">Количество готовой продукции / дополнительная единица измерения</td>
															<td class="bordered" colspan="3">Документ бухгалтерского учета, согласно которому готовая продукция учтена Заявителем</td>														</tr>
														<tr valign="top" align="center">
															<td class="bordered">наименование</td>
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
														</tr>
														<xsl:apply-templates select="aeg:FinishedProducts" mode="DocKind2_table2"/>
													</tbody>
												</table>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:choose>
							<xsl:when test="$DocKind = 1">
								<xsl:text>Документы, подтверждающие права владения, пользования и (или) распоряжения товарами и (или) готовой продукцией:</xsl:text>
								<table style="talbe-layout:fixed; width: 200mm;">
									<tbody>
										<tr align="center" valign="top">
											<td class="bordered">№ п/п</td>
											<td class="bordered">Наименование документа</td>
											<td class="bordered">Реквизиты документа (номер, дата)</td>
										</tr>
										<tr align="center">
											<td class="bordered">1</td>
											<td class="bordered">2</td>
											<td class="bordered">3</td>
										</tr>
										<xsl:apply-templates select="aeg:OwnerRightsDoc" mode="doc_row">
											<xsl:with-param name="hasSheetCount" select="number(0)"/>
										</xsl:apply-templates>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:text>Цели вывоза и использования товаров и (или) готовой продукции для собственных производственных и технологических нужд в соответствии с видами деятельности, предусмотренными соглашениями об осуществлении деятельности на территории опережающего развития (свободного порта Владивосток): </xsl:text>
								<xsl:apply-templates select="aeg:PurposeOfExport"/>
								<br/>
								<br/>
								<xsl:text>Место вывоза (использования) товаров </xsl:text>
								<br/>
								<table style="display: inline-block; table-layout: fixed; width: 270mm;">
									<tbody>
										<tr>
											<td>
												<xsl:for-each select="aeg:PlaceOfExport/*">
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
										<tr align="center" valign="top">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(часть территории Российской Федерации, включенная в перечень территорий государств - членов Евразийского экономического союза, на которые из свободных (специальных, особых) экономических зон допускается вывоз товаров и (или) готовой продукции<sup>3</sup>, наименование объекта, адрес)
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<xsl:text>Срок вывоза (использования) товаров для собственных производственных нужд до </xsl:text>
								<table style="display: inline-block; table-layout: fixed; width: 120mm;">
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="aeg:ExportDate" mode="month_year_date"/>
											</td>
										</tr>
										<tr align="center" valign="top">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(месяц, год)
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:text>Опись документов</xsl:text>
								<table style="talbe-layout:fixed; width: 200mm;">
									<tbody>
										<tr align="center" valign="top">
											<td class="bordered">№ п/п</td>
											<td class="bordered">Наименование документа</td>
											<td class="bordered">Реквизиты документа (номер, дата)</td>
											<td class="bordered">Количество листов</td>
										</tr>
										<tr align="center">
											<td class="bordered">1</td>
											<td class="bordered">2</td>
											<td class="bordered">3</td>
											<td class="bordered">4</td>
										</tr>
										<xsl:apply-templates select="aeg:OwnerRightsDoc" mode="doc_row"/>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:text>Сведения о лице, подающем заявление</xsl:text>
								<br/>
								<table style="display: inline-block; table-layout: fixed; width: 270mm;">
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="aeg:AuthorizedPerson"/>
											</td>
										</tr>
										<tr align="center" valign="top">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(наименование организации, ОГРН, ИНН и КПП, адрес юридического лица в пределах места нахождения, если заявление подается не резидентом территории опережающего развития (свободного порта Владивосток), а лицом, им уполномоченным)
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<br/>
								<table style="display: inline-block; width: 150mm;">
									<tbody>
										<tr valign="top">
											<td width="45%">
												<xsl:apply-templates select="aeg:ResidentSignature" mode="DocKind1Sign"/>
												<br/>
												<br/>
												<xsl:apply-templates select="aeg:ConfirmDoc" mode="doc"/>
											</td>
											<td width="10%"></td>
											<td width="45%"></td>
										</tr>
										<tr align="center" valign="top">
											<td style="font-size: 8pt;border-top: 1px solid black;">
												(фамилия, имя, отчетство (при наличии), должность лица (при наличии), подающего заявление и реквизиты документа, подтверждающего полномочия такого лица)
											</td>
											<td width="10%"></td>
											<td style="font-size: 8pt;border-top: 1px solid black;">(подпись)</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:text>______________________________</xsl:text>
								<br/>
								<div style="font-size: 8pt; width: 100%;">
									<sup>1</sup>Приложение № 1 к Договору о Таможенном кодексе Евразийского экономического союза (официальный сайт Евразийского экономического союза: http://eaeunion.org/, 12.04.2017); является обязательным для Российской Федерации в соответствии с Федеральным законом от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза". Вступил в силу для Российской Федерации 1 января 2018 г.
									<br/>
									<sup>2</sup>Решение Совета Евразийской экономической комиссии от 14 сентябры 2021 г. № 80 "Об утверждении единой Товарной номенклатуры внешнеэкономической деятельности Евразийского экономического союза и Единого таможенного тарифа Евразийского экономического союза, а также об изменении и признании утратившими силу некоторых решений Совета Евразийской экономической комиссии" (официфльный сайт Евразийского экономического союза http://eaeunion.org/, 6 октября 2021г.), с изменениями, внесенными в Решением Коллегии Евразийской экономической комиссии от 7 марта 2023 г. № 24 (официфльный сайт Евразийского экономического союза http://eaeunion.org/, 10 марта 2023 г.). Является обязательным для Российской Федерации в соответствии с Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом от 3 октября 2014 г. № 279-ФЗ "О ратификации Договора о Евразийском экономическом союзе". Вступило в силу для Российской Федерации 16 октября 2021 г.
									<br/>
									<sup>3</sup>Решение Совета Евразийской экономической комиссии от 20 декабря 2017 г. № 88 "О некоторых вопросах применения таможенной процедуры свободной таможенной зоны" (официфльный сайт Евразийского экономического союза http://eaeunion.org/, 26 декабря 2017 г.), с изменениями, внесенными Решением Совета Евразийской экономической комиссии от 25 января 2023 г. № 18 (официфльный сайт Евразийского экономического союза http://eaeunion.org/, 27 января 2023г.). Является обязательным для Российской Федерации в соответствии с Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом  от 3 октября 2014 г. № 279-ФЗ "О ратификации Договора о Евразийском экономическом союзе". Вступает в силу для Российской Федерации 1 января 2015 г.
								</div>
							</xsl:when>
							<xsl:when test="$DocKind = 2">
								<xsl:text>Документы, подтверждающие права владения, пользования и (или) распоряжения товарами, помещенными под таможенную процедуру свободной таможенной зоны, и (или) готовой продукции:</xsl:text>
								<table style="talbe-layout:fixed; width: 200mm;">
									<tbody>
										<tr align="center" valign="top">
											<td class="bordered">№ п/п</td>
											<td class="bordered">Наименование документа</td>
											<td class="bordered">Реквизиты документа (номер, дата)</td>
											<td class="bordered">Количество листов</td>
										</tr>
										<tr align="center">
											<td class="bordered">1</td>
											<td class="bordered">2</td>
											<td class="bordered">3</td>
											<td class="bordered">4</td>
										</tr>
										<xsl:apply-templates select="aeg:OwnerRightsDoc" mode="doc_row"/>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:text>Цель вывоза и использования товаров для собственных производственных и технологических нужд (в соответствии с видом деятельности, предусмотренным договором об условиях деятельности в свободной экономической зоне, если товары вывозятся участником свободной экономической зоны): </xsl:text>
								<xsl:apply-templates select="aeg:PurposeOfExport"/>
								<br/>
								<br/>
								<xsl:text>Место вывоза, размещения и использования товаров </xsl:text>
								<br/>
								<table style="display: inline-block; table-layout: fixed; width: 270mm;">
									<tbody>
										<tr>
											<td>
												<xsl:for-each select="aeg:PlaceOfExport/*">
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
										<tr align="center" valign="top">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(часть территории свободной экономической зоны, наименование объекта (при наличии), адрес (при наличии)
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:text>Опись документов</xsl:text>
								<table style="talbe-layout:fixed; width: 200mm;">
									<tbody>
										<tr align="center" valign="top">
											<td class="bordered">№ п/п</td>
											<td class="bordered">Наименование документа</td>
											<td class="bordered">Реквизиты документа (номер, дата)</td>
											<td class="bordered">Количество листов</td>
										</tr>
										<tr align="center">
											<td class="bordered">1</td>
											<td class="bordered">2</td>
											<td class="bordered">3</td>
											<td class="bordered">4</td>
										</tr>
										<xsl:apply-templates select="aeg:OwnerRightsDoc" mode="doc_row"/>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:text>Сведения о лице, подающем заявление</xsl:text>
								<br/>
								<table style="display: inline-block; table-layout: fixed; width: 270mm;">
									<tbody>
										<tr>
											<td>
												<xsl:apply-templates select="aeg:AuthorizedPerson"/>
											</td>
										</tr>
										<tr align="center" valign="top">
											<td style="font-size: 8pt; border-top: 1px solid black;">
												(наименование организации, ОГРН, ИНН и КПП, адрес юридического лица в пределах места нахождения, если заявление подается лицом, уполномоченным Заявителем на подачу заявления)
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<br/>
								<table style="display: inline-block; width: 270mm;">
									<tbody>
										<tr valign="top" align="center">
											<td width="25%">
												<xsl:apply-templates select="aeg:ResidentSignature/cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="aeg:ResidentSignature/cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="aeg:ResidentSignature/cat_ru:PersonMiddleName"/>
											</td>
											<td width="5%"></td>
											<td width="25%">
												<xsl:apply-templates select="aeg:ResidentSignature/cat_ru:PersonPost"/>
											</td>
											<td width="5%"></td>
											<td width="20%">
												<xsl:apply-templates select="aeg:ConfirmDoc" mode="doc"/>
											</td>
											<td width="5%"></td>
											<td width="15%"></td>
										</tr>
										<tr align="center" valign="top">
											<td style="font-size: 8pt;border-top: 1px solid black;">
												(фамилия, имя, отчетство (при наличии)
											</td>
											<td></td>
											<td style="font-size: 8pt;border-top: 1px solid black;">
												(должность лица, подающего заявление (при наличии)
											</td>
											<td></td>
											<td style="font-size: 8pt;border-top: 1px solid black;">
												(реквизиты документа, подтверждающие полномочия лица)
											</td>
											<td></td>
											<td style="font-size: 8pt;border-top: 1px solid black;">(подпись)</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<br/>
								<xsl:text>______________________________</xsl:text>
								<br/>
								<div style="font-size: 8pt; width: 100%;">
									<sup>1</sup> Далее - Федеральный закон № 377-ФЗ
									<br/>
									<sup>2</sup> Пункт 1 части 4 статьи 18 Федерального закона № 377-ФЗ
								</div>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="$DocKind = 3">
						<br/>
						<br/>
						<xsl:text>2. Цель вывоза и использования товаров, помещаемых под процедуру свободной таможенной зоны, для собственных производственных и технологических нужд в соответствии с видами деятельности, предусмотренными соглашением об осуществленнии деятельности на территории Особой экономической зоны </xsl:text>
						<br/>
						<xsl:apply-templates select="aeg:PurposeOfExport"/>
						<br/>
						<br/>
						<xsl:text>3. Место размещения и использования товаров, помещенных под таможенную процедуру свободной таможенной зоны, на остальной части территории Магаданской области</xsl:text>
						<br/>
						<xsl:for-each select="aeg:PlaceOfExport/*">
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
						<br/>
						<br/>
						<table style="display: inline-block; width: 150mm;">
							<tbody>
								<tr valign="top">
									<td width="45%">
										<xsl:apply-templates select="aeg:ResidentSignature" mode="DocKind1Sign"/>
										<br/>
										<br/>
										<xsl:apply-templates select="aeg:ConfirmDoc" mode="doc"/>
									</td>
									<td width="10%"></td>
									<td width="45%"></td>
								</tr>
								<tr align="center" valign="top">
									<td style="font-size: 8pt;border-top: 1px solid black;">
										(фамилия, имя, отчетство (при наличии), должность лица (при наличии), подающего заявление и реквизиты документа, подтверждающего полномочия такого лица)
									</td>
									<td width="10%"></td>
									<td style="font-size: 8pt;border-top: 1px solid black;">(подпись)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:text>______________________________</xsl:text>
						<br/>
						<div style="font-size: 8pt; width: 100%;">
							<sup>1</sup>Приложение № 1 к Договору о Таможенном кодексе Евразийского экономического союза (официальный сайт Евразийского экономического союза: http://eaeunion.org/, 12.04.2017); является обязательным для Российской Федерации в соответствии с Федеральным законом от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза". Таможенный кодекс Евразийского экономического союза вступил в силу для Российской Федерации 1 января 2018 г.
							<br/>
							<sup>2</sup>Решение Совета Евразийской экономической комиссии от 14 сентябры 2021 г. № 80 "Об утверждении единой Товарной номенклатуры внешнеэкономической деятельности Евразийского экономического союза и Единого таможенного тарифа Евразийского экономического союза, а также об изменении и признании утратившими силу некоторых решений Совета Евразийской экономической комиссии" (официфльный сайт Евразийского экономического союза http://eaeunion.org/, 6 октября 2021г.), с изменениями, внесенными в Решением Коллегии Евразийской экономической комиссии от 7 марта 2023 г. № 24 (официфльный сайт Евразийского экономического союза http://eaeunion.org/, 10 марта 2023 г.). Является обязательным для Российской Федерации в соответствии с Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом от 3 октября 2014 г. № 279-ФЗ "О ратификации Договора о Евразийском экономическом союзе". Вступило в силу для Российской Федерации 16 октября 2021 г.
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="aeg:ResidentSignature" mode="DocKind1Sign">
		<xsl:for-each select="*[local-name() != 'IssueDate' and local-name() != 'PersonPost']">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="*[local-name() = 'PersonPost']">
			<br/>
			<xsl:apply-templates select="*[local-name() = 'PersonPost']"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="doc_row">
		<xsl:param name="hasSheetCount" select="1"/>
		<tr align="center" valign="top">
			<td class="bordered">
				<xsl:apply-templates select="aeg:Position"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="cat_ru:PrDocumentName"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="." mode="doc"/>
			</td>
			<xsl:if test="$hasSheetCount = 1">
				<td class="bordered">
					<xsl:apply-templates select="aeg:SheetsNumber"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
	
	<xsl:template match="aeg:GoodsKind">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">
					<xsl:text>декларируемых в соответствии с таможенной процедурой своободной таможенной зоны</xsl:text>
				</xsl:when>
				<xsl:when test=". = 2">
					<xsl:text>помещенных под таможенную процедуру свободной таможенной зоны</xsl:text>
				</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<!-- ТАБЛИЦА 1-->
	<xsl:template match="aeg:STZ_Goods" mode="DocKind1_table1">
		<xsl:variable name="rowspan">
			<xsl:choose>
				<xsl:when test="count(aeg:PropertyGoodsDecl) = 0">1</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="count(aeg:PropertyGoodsDecl)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr valign="top">
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:Position"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsDescription"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsTNVEDCode"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsIdentification"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsWeightQuantity"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:for-each select="aeg:GoodsQuantity">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity_t1"/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="aeg:PropertyGoodsDecl[1]/aeg:DeclRegNum" mode="reg_num"/>
			</td>
			<td class="bordered">
				<xsl:for-each select="aeg:PropertyGoodsDecl[1]/aeg:GoodsDeclnfo/aeg:GoodsNumber">
					<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsStatus"/>
			</td>
		</tr>
		<xsl:for-each select="aeg:PropertyGoodsDecl[position() &gt; 1]">
			<tr valign="top">
				<td class="bordered">
					<xsl:apply-templates select="aeg:DeclRegNum" mode="reg_num"/>
				</td>
				<td class="bordered">
					<xsl:for-each select="aeg:GoodsDeclnfo/aeg:GoodsNumber">
						<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="aeg:STZ_Goods" mode="DocKind2_table1">
		<xsl:variable name="rowspan">
			<xsl:choose>
				<xsl:when test="count(aeg:PropertyGoodsDecl) = 0">1</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="count(aeg:PropertyGoodsDecl)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr valign="top">
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:Position"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsDescription"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsTNVEDCode"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsIdentification"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsWeightQuantity"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:for-each select="aeg:GoodsQuantity">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity_t1"/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="aeg:PropertyGoodsDecl[1]/aeg:DeclRegNum" mode="reg_num"/>
			</td>
			<td class="bordered">
				<xsl:for-each select="aeg:PropertyGoodsDecl[1]/aeg:GoodsDeclnfo/aeg:GoodsNumber">
					<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:for-each select="aeg:PropertyGoodsDecl[position() &gt; 1]">
			<tr valign="top">
				<td class="bordered">
					<xsl:apply-templates select="aeg:DeclRegNum" mode="reg_num"/>
				</td>
				<td class="bordered">
					<xsl:for-each select="aeg:GoodsDeclnfo/aeg:GoodsNumber">
						<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="aeg:STZ_Goods" mode="DocKind3_table1">
		<xsl:variable name="rowspan">
			<xsl:choose>
				<xsl:when test="count(aeg:PropertyGoodsDecl) = 0">1</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="count(aeg:PropertyGoodsDecl)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr valign="top">
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:Position"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsDescription"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsTNVEDCode"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsIdentification"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsWeightQuantity"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:for-each select="aeg:GoodsQuantity">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity_t1"/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				<xsl:for-each select="aeg:PropertyGoodsDecl[1]/aeg:GoodsDeclnfo/aeg:GoodsNumber">
					<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:for-each select="aeg:PropertyGoodsDecl[position() &gt; 1]">
			<tr valign="top">
				<td class="bordered">
					<xsl:for-each select="aeg:GoodsDeclnfo/aeg:GoodsNumber">
						<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<!-- /ТАБЛИЦА 1-->
	
	<!-- ТАБЛИЦА 2-->
	<xsl:template match="aeg:FinishedProducts" mode="DocKind1_table2">
		<xsl:variable name="rowspan">
			<xsl:choose>
				<xsl:when test="count(aeg:AccountWorkDoc) = 0">1</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="count(aeg:AccountWorkDoc)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr valign="top">
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:Position"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsDescription"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsTNVEDCode"/>
				<xsl:if test="aeg:Cost">
					<xsl:text>/ </xsl:text>
					<xsl:apply-templates select="aeg:Cost"/>
				</xsl:if>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsIdentification"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsWeightQuantity"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:for-each select="aeg:GoodsQuantity">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity_t1"/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="aeg:AccountWorkDoc[1]/cat_ru:PrDocumentName"/>
			</td>
			<td>
				<xsl:apply-templates select="aeg:AccountWorkDoc[1]/cat_ru:PrDocumentName"/>
				<xsl:if test="aeg:AccountWorkDoc[1]/cat_ru:PrDocumentName and aeg:AccountWorkDoc[1]/cat_ru:PrDocumentDate">
					<xsl:text>/</xsl:text>
				</xsl:if>
				<xsl:apply-templates select="aeg:AccountWorkDoc[1]/cat_ru:PrDocumentDate" mode="russian_date"/>
			</td> 
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsStatus"/>
			</td>
		</tr>
		<xsl:for-each select="aeg:AccountWorkDoc[position() &gt; 1]">
			<tr valign="top">
				<td class="bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
					<xsl:if test="cat_ru:PrDocumentName and cat_ru:PrDocumentDate">
						<xsl:text>/</xsl:text>
					</xsl:if>
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="aeg:FinishedProducts" mode="DocKind2_table2">
		<xsl:variable name="rowspan">
			<xsl:choose>
				<xsl:when test="count(aeg:AccountWorkDoc) = 0">1</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="count(aeg:AccountWorkDoc)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr valign="top">
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:Position"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsDescription"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsTNVEDCode"/>
				<xsl:if test="aeg:Cost">
					<xsl:text>/ </xsl:text>
					<xsl:apply-templates select="aeg:Cost"/>
				</xsl:if>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsIdentification"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="aeg:GoodsWeightQuantity"/>
			</td>
			<td class="bordered" rowspan="{$rowspan}">
				<xsl:for-each select="aeg:GoodsQuantity">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity_t1"/>
				</xsl:for-each>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="aeg:AccountWorkDoc[1]/cat_ru:PrDocumentName"/>
			</td>
			<td class="bordered">
				<xsl:apply-templates select="aeg:AccountWorkDoc[1]/cat_ru:PrDocumentName"/>
			</td> 
			<td class="bordered">
				<xsl:apply-templates select="aeg:AccountWorkDoc[1]/cat_ru:PrDocumentDate" mode="russian_date"/>
			</td>
		</tr>
		<xsl:for-each select="aeg:AccountWorkDoc[position() &gt; 1]">
			<tr valign="top">
				<td class="bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentName"/>
				</td>
				<td class="bordered">
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<!-- ТАБЛИЦА 2-->
	
	
	<xsl:template match="aeg:GoodsStatus">
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
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/ </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
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
	<xsl:template match="*" mode="quantity_t1">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:if test="*[local-name() = 'GoodsQuantity'] and *[local-name() = 'MeasureUnitQualifierName']">
		<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
	</xsl:template>
	
	<xsl:template match="aeg:GoodsIdentification">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="aeg:Resident|aeg:AuthorizedPerson">
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
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<xsl:text>, ОГРНИП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
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
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="aeg:ResidentCertificate"/>
	</xsl:template>
	<xsl:template match="aeg:ResidentCertificate">
		<xsl:text>, свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="aeg:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="aeg:CertificateDate" mode="russian_date"/>
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
	
	<xsl:template match="aeg:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:Code"/>
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
	<xsl:template name="month_year_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:variable name="month" select="number(substring($dateIn,6,2))"/>
				<xsl:choose>
					<xsl:when test="$month = 1">январь</xsl:when>
					<xsl:when test="$month = 2">февраль</xsl:when>
					<xsl:when test="$month = 3">март</xsl:when>
					<xsl:when test="$month = 4">арпель</xsl:when>
					<xsl:when test="$month = 5">май</xsl:when>
					<xsl:when test="$month = 6">июнь</xsl:when>
					<xsl:when test="$month = 7">июль</xsl:when>
					<xsl:when test="$month = 8">август</xsl:when>
					<xsl:when test="$month = 9">сентябрь</xsl:when>
					<xsl:when test="$month = 10">октябрь</xsl:when>
					<xsl:when test="$month = 11">ноябрь</xsl:when>
					<xsl:when test="$month = 12">декабрь</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> года</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='STZ_AppExportGoods']//*" priority="-1">
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
	<xsl:template match="*" mode="month_year_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="month_year_date">
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
