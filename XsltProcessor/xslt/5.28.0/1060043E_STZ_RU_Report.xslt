<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cltESAD_ru="urn:customs.ru:RUCommonLeafTypes:5.4.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.24.0" xmlns:stz_ru="urn:customs.ru:Information:CustomsDocuments:STZ_RU_Report:5.28.0">
	<xsl:variable name="DocType" select="stz_ru:STZ_RU_Report/stz_ru:DocType"/>
	<xsl:template match="stz_ru:STZ_RU_Report">
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
				<div class="page" style="width: {$w}mm; height: 190mm;">
					<xsl:call-template name="title_sheet"/>
					<!-- Титульный лист. Контекст - корневой узел -->
				</div>
				<div class="page" style="width: {($w + 20) * 4 - 20}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<b>Таблица № 1. Товары, помещенные под таможенную процедуру свободной таможенной зоны</b>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:call-template name="table1"/>
					<!-- Таблица 1. Контекст - корневой узел -->
				</div>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<b>
										Таблица 1.1. 
										<xsl:choose>
											<xsl:when test="$DocType &lt; 6">Товары, помещенные под таможенную процедуру свободной таможенной зоны для целей совершения операций по переработке товаров в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса ЕАЭС</xsl:when>
											<xsl:otherwise>Сведения о товарах, вывезенных для собственных производственных и технологических нужд на остальную часть территории Магаданской области (далее - вывезенные товары)</xsl:otherwise>
										</xsl:choose>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:call-template name="table1_1"/>
					<!-- Таблица 1.1. Контекст - корневой узел -->
				</div>
				<div class="page" style="width: {($w + 20) * 4 - 20}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<b>
										Таблица 2. 
										<xsl:choose>
											<xsl:when test="$DocType &lt; 6">Товары, изготовленные (полученные) из товаров, помещенных под таможенную процедуру свободной таможенной зоны на отчетную дату согласно сведениям, указанным в таблице №1.1</xsl:when>
											<xsl:otherwise>Сведения о товарах, вывезенных для собственных производственных и технологических нужд на остальную часть территории Магаданской области (далее - вывезенные товары)</xsl:otherwise>
										</xsl:choose>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:call-template name="table2"/>
					<!-- Таблица 2. Контекст - корневой узел -->
				</div>
				<xsl:if test="$DocType = 1">
					<div class="page" style="width: {($w + 20) * 2 - 20}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>
											Таблица 3. 
											<xsl:choose>
												<xsl:when test="$DocType = 1">Транспортные средства для первозки грузов, тягачи, прицепы, полуприцеаы, пожарные автомобили и специально предназначенные для медицинских целей автомобили, автобусы, воздушные суда, водные суда, железнодорожный подвижной состав (включая порожние транспортные средства), помещенные под таможенную процедуру свободной таможенной зоны и используемые в качестве транспортных средств международной перевозки</xsl:when>
												<!--
												<xsl:when test="$DocType = 4">Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны и вывезенных для собственных производственных и технологических нужд или совершения операций по переработке (обработке) и (или) изготовлению товаров</xsl:when>
												<xsl:when test="$DocType = 5">Сведения о товарах, помещенных под таможенную процедуру свободной таможенной зоны и вывезенных для собственных производственных и технологических нужд резидентом свободного порта Владивосток</xsl:when>
												-->
											</xsl:choose>
										</b>
									</td>
								</tr>
							</tbody>
						</table>
						<xsl:call-template name="table3"/>
						<!-- Таблица 3. Контекст - корневой узел -->
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="table3">
		<xsl:choose>
			<xsl:when test="$DocType = 1">
				<!-- Два раздела, две таблицы -->
				<table>
					<tbody>
						<tr>
							<td align="center">
									Раздел 1. Транспортные средства для перевозки грузов, тягачи, прицепы, полуприцепы, пожарные автомобили и специально предназначенные для медицинских целей автомобили, автобусы, воздушные суда, водняе суда, железнодорожный подвижной состав (включая порожние транспортные средства), помещенные под таможенную процедуру СТЗ и использованные в качестве транспортных средств международной перевозки (далее - ТСМП)
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="3">№ п/п</td>
							<td class="graphMain bordered" rowspan="3">Наименование ТСМП</td>
							<td class="graphMain bordered" rowspan="3">Код по ТН ВЭД ЕАЭС</td>
							<td class="graphMain bordered" rowspan="3">№ ДТ</td>
							<td class="graphMain bordered" colspan="10">Распоряжение товарами, помещенными под таможенную процедуру</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="2">транспортное средство, которое было передано во временное пользование (аренда)</td>
							<td class="graphMain bordered" colspan="3">транспортное средство, которое было отчуждено</td>
							<td class="graphMain bordered" colspan="2">транспортное средство, в отношении которого действие таможенной процедуры СТЗ завершено</td>
							<td class="graphMain bordered" colspan="2">транспортное средство утилизированное (утраченное)</td>
							<td class="graphMain bordered" rowspan="2">местонахождение транспортного средстава, находящегося в распоряжении у лица</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">наименование лица</td>
							<td class="graphMain bordered">период</td>
							<td class="graphMain bordered">наименование лица</td>
							<td class="graphMain bordered">период</td>
							<td class="graphMain bordered">номер и дата документа</td>
							<td class="graphMain bordered">код таможенной процедуры</td>
							<td class="graphMain bordered">№ ДТ</td>
							<td class="graphMain bordered">стоимость</td>
							<td class="graphMain bordered">номер документа</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered">10</td>
							<td class="graphMain bordered">11</td>
							<td class="graphMain bordered">12</td>
							<td class="graphMain bordered">13</td>
							<td class="graphMain bordered">14</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table3/stz_ru:TransportMeans" mode="DocType1_table3_1"/>
					</tbody>
				</table>
				<br/>
				<br/>
				<table>
					<tbody>
						<tr>
							<td align="center">
									Раздел 2. Использование транспортных средств, помещенных под таможенную процедуру СТЗ, в качестве ТСМП (транспортные средства для перевозки грузов, тягачи, прицепы, полуприцепы, пожарные автомобили и специально предназначенные для медицинских целей автомобили, автобусы, воздушные суда, водные суда, железнодорожный подвижной состав (включая порожние транспортные средства)
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered">Марка, модель ТСМП</td>
							<td class="graphMain bordered">Идентификационный номер (VIN) ТСМП</td>
							<td class="graphMain bordered">№ ДТ</td>
							<td class="graphMain bordered">Государственный регистрационный номер</td>
							<td class="graphMain bordered">Дата убытия с территории ОЭЗ в Калининградской области (груженый/порожний)</td>
							<td class="graphMain bordered">Маршрут</td>
							<td class="graphMain bordered">Дата прибытия на территорию ОЭЗ Калининградской области (гружены/порожний)</td>
							<td class="graphMain bordered">№ таможенного документа при перемещении через таможенную границу Евразийского экономического союза</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered">8</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table3/stz_ru:TransportMeansUse" mode="DocType1_table3_2"/>
					</tbody>
				</table>
			</xsl:when>
			<!--
			<xsl:when test="$DocType = 4">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">№ п/п</td>
							<td class="graphMain bordered" rowspan="2">Наименование товара и его описание</td>
							<td class="graphMain bordered" rowspan="2">№ таможенной декларации / порядковый номер товара в таможенной декларации</td>
							<td class="graphMain bordered" colspan="3">Товары, помещенные под таможенную процедуру СТЗ (количество)</td>
							<td class="graphMain bordered" rowspan="2">Местнахождние товара</td>
							<td class="graphMain bordered" colspan="3">Вывоз товаров для собственных производственных и технологических нужд</td>
							<td class="graphMain bordered" colspan="3">Вывоз товаров для совершения операций по переработке (обработке), изготовлению товаров</td>
							<td class="graphMain bordered" rowspan="2">Примечание (при наличии)</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">до начала отчетного периода</td>
							<td class="graphMain bordered">за отчетный период</td>
							<td class="graphMain bordered">всего</td>
							<td class="graphMain bordered">№ разрешения таможенного органа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">остаток</td>
							<td class="graphMain bordered">№ разрешения таможенного органа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">остаток</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered" colspan="3">8</td>
							<td class="graphMain bordered" colspan="3">9</td>
							<td class="graphMain bordered">10</td>
						</tr>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="$DocType = 5">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">№ п/п</td>
							<td class="graphMain bordered" rowspan="2">Наименование товара и его описание</td>
							<td class="graphMain bordered" rowspan="2">№ таможенной декларации / порядковый номер товара в таможенной декларации</td>
							<td class="graphMain bordered" colspan="3">Товары, помещенные под таможенную процедуру свободной таможенной зоны (количество)</td>
							<td class="graphMain bordered" rowspan="2">Местнахождние товара</td>
							<td class="graphMain bordered" colspan="3">Операции с товарами в соответствии с частью 5 статьи 26<sup>2</sup> Федерального закона от 13 июля 2015 г. № 212-ФЗ "О свободном порте Владивосток"</td>
							<td class="graphMain bordered" rowspan="2">Примечание (при наличии)</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">до начала отчетного периода</td>
							<td class="graphMain bordered">за отчетный период</td>
							<td class="graphMain bordered">всего</td>
							<td class="graphMain bordered">наименование операции</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">остаток</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered" colspan="3">8</td>
							<td class="graphMain bordered">9</td>
						</tr>
					</tbody>
				</table>
			</xsl:when>
			-->
		</xsl:choose>
	</xsl:template>
	<xsl:template name="table2">
		<xsl:choose>
			<xsl:when test="$DocType = 1">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="4">Количество товара</td>
							<td class="graphMain bordered" rowspan="4">Единица измерения количества товара</td>
							<td class="graphMain bordered" colspan="16">Распоряжение товарами, изготовленными (полученными) из товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" colspan="2" rowspan="3">Остатки товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру СТЗ</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="4">помещено под таможенную процедуру</td>
							<td class="graphMain bordered" colspan="12">иное использование</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры</td>
							<td class="graphMain bordered" rowspan="2">№ таможенной декларации, № товара в таможенной декларации</td>
							<td class="graphMain bordered" rowspan="2">количество товара, единица измерения</td>
							<td class="graphMain bordered" rowspan="2">реквизиты документа, подтверждающего статус товара, изготовленного (полученного) из ностранных товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="2">товар, полностью израсходованные в соответствии с подпунктом 4 пункта 1 статьи 105 Таможенного кодекса ЕАЭС (количество)</td>
							<td class="graphMain bordered" colspan="2">потребление товаров в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="3">передача товара иному лицу</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="2">отбор проб и образцов</td>
							<td class="graphMain bordered" colspan="2">вывоз товаров без завершения таможенной процедуры СТЗ</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">наименование лица</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">вес нетто</td>
							<td class="graphMain bordered">реквизиты документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered" colspan="2">10</td>
							<td class="graphMain bordered" colspan="3">11</td>
							<td class="graphMain bordered" colspan="2">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="2">15</td>
						</tr>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsForeign">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные (полученные) из иностранных товаров</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsForeign" mode="DocType1_table2"/>
						</xsl:if>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsMix">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные (полученные) с использованием иностранных товаров</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsMix" mode="DocType1_table2"/>
						</xsl:if>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные из товаров ЕАЭС</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsGU" mode="DocType1_table2"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="$DocType = 2">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="4">Количество товара</td>
							<td class="graphMain bordered" rowspan="4">Единица измерения количества товара</td>
							<td class="graphMain bordered" colspan="18">Распоряжение товарами, изготовленными (полученными) из товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" colspan="2" rowspan="3">Остатки товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру СТЗ</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="4">помещено под таможенную процедуру</td>
							<td class="graphMain bordered" colspan="14">иное использование</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры</td>
							<td class="graphMain bordered" rowspan="2">№ таможенной декларации, № товара в таможенной декларации</td>
							<td class="graphMain bordered" rowspan="2">количество товара, единица измерения</td>
							<td class="graphMain bordered" rowspan="2">реквизиты документа, подтверждающего статус товара, изготовленного (полученного) из ностранных товаров, помещенных под таможенную процедуру СТЗ, выданного органом, уполномоченным Правительством Российской Федерации</td>
							<td class="graphMain bordered" rowspan="2">товары, полностью израсходованные в соответствии с подпунктом 4 пункта 1 статьи 105 Таможенного кодекса ЕАЭС (количество)</td>
							<td class="graphMain bordered" colspan="2">потребление товаров в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="3">передача товара иному резиденту или иному лицу в соответствиии пунктами 8, 10 статьи 205 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="2">отбор проб и образцов</td>
							<td class="graphMain bordered" colspan="2">вывоз товара в соответствии с подпунктом 3 пункта 4 статьи 205Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">вывоз товаров без завершения таможенной процедуры свободной таможенной зоны</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">наименование лица</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">вес нетто</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ транзитной декларации</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered" colspan="2">10</td>
							<td class="graphMain bordered" colspan="3">11</td>
							<td class="graphMain bordered" colspan="2">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="2">15</td>
							<td class="graphMain bordered" colspan="2">16</td>
						</tr>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsForeign">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные (полученные) из иностранных товаров</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsForeign" mode="DocType2_table2"/>
						</xsl:if>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsMix">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные (полученные) с использованием иностранных товаров</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsMix" mode="DocType2_table2"/>
						</xsl:if>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные из товаров ЕАЭС</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsGU" mode="DocType2_table2"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="$DocType = 3 or $DocType= 4 or $DocType = 5">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="4">Единица измерения</td>
							<td class="graphMain bordered" rowspan="2" colspan="3">Количество товара</td>
							<td class="graphMain bordered" colspan="18">Распоряжение товарами, изготовленными (полученными) из товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="4">Остатки товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру СТЗ</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="4">помещено под таможенную процедуру</td>
							<td class="graphMain bordered" colspan="14">иное использование</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">до начала отчетного периода</td>
							<td class="graphMain bordered" rowspan="2">за отчетный период</td>
							<td class="graphMain bordered" rowspan="2">всего</td>
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры</td>
							<td class="graphMain bordered" rowspan="2">№ таможенной декларации, № товара в таможенной декларации</td>
							<td class="graphMain bordered" rowspan="2">количество товара, единица измерения</td>
							<td class="graphMain bordered" rowspan="2">реквизиты документа, подтверждающего статус товара, изготовленного (полученного) из ностранных товаров, помещенных под таможенную процедуру СТЗ, выданного органом, уполномоченным Правительством Российской Федерации</td>
							<td class="graphMain bordered" rowspan="2">товары, полностью израсходованные в соответствии с подпунктом 4 пункта 1 статьи 105 Таможенного кодекса ЕАЭС (количество)</td>
							<td class="graphMain bordered" colspan="2">потребление товаров в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="3">передача товара иному участнику или иному лицу</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="2">отбор проб и образцов</td>
							<td class="graphMain bordered" colspan="2">вывоз товара в соответствии с подпунктом 3 пункта 4 статьи 205Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">вывоз товаров без завершения таможенной процедуры свободной таможенной зоны</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">наименование лица</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">вес нетто</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ транзитной декларации</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered" colspan="3">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered" colspan="2">10</td>
							<td class="graphMain bordered" colspan="3">11</td>
							<td class="graphMain bordered" colspan="2">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="2">15</td>
							<td class="graphMain bordered" colspan="2">16</td>
						</tr>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsForeign">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные (полученные) из иностранных товаров</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsForeign" mode="DocType3-5_table2"/>
						</xsl:if>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsMix">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные (полученные) с использованием иностранных товаров</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsMix" mode="DocType3-5_table2"/>
						</xsl:if>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="24">Товары, изгтовленные из товаров ЕАЭС</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsGU" mode="DocType3-5_table2"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="$DocType = 6">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="4">Код продукции в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского эконмического союза<sup>4</sup>
							</td>
							<td class="graphMain bordered" rowspan="2" colspan="3">Количество продукции</td>
							<td class="graphMain bordered" colspan="18">Распоряжение товарами, изготовленными (полученными) из товаров, помещенных под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="4">Остатки товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру СТЗ</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="4">помещено под таможенную процедуру</td>
							<td class="graphMain bordered" colspan="14">иное использование</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">до начала отчетного периода</td>
							<td class="graphMain bordered" rowspan="2">за отчетный период</td>
							<td class="graphMain bordered" rowspan="2">всего</td>
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры в соответствии с Классификатором</td>
							<td class="graphMain bordered" rowspan="2">номер таможенной декларации/ порядковый номер продукции в таможенной декларации</td>
							<td class="graphMain bordered" rowspan="2">количество товара, единица измерения количества</td>
							<td class="graphMain bordered" rowspan="2">номер и дата документа, подтверждающего статус продукции</td>
							<td class="graphMain bordered" colspan="2">потребление товаров в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" rowspan="2">количество продукции, в отношении которой совершены операции по переработке (обработке)</td>
							<td class="graphMain bordered" colspan="2">создание объектов недвижимости</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="2">отбор проб и (или) образцов в соответствии со статьей 17 ТК ЕАЭС</td>
							<td class="graphMain bordered" colspan="3">товары, переданные иному лицу</td>
							<td class="graphMain bordered" colspan="2">вывоз товаров без завершения таможенной процедуры СТЗ</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер и дата документа</td>
							<td class="graphMain bordered">вес нетто</td>
							<td class="graphMain bordered">номер и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер разрешения таможенного органа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">лицо, которому переданы товары</td>
							<td class="graphMain bordered">номер и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер разрешения таможенного органа</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered">10</td>
							<td class="graphMain bordered" colspan="2">11</td>
							<td class="graphMain bordered">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="2">15</td>
							<td class="graphMain bordered" colspan="3">16</td>
							<td class="graphMain bordered" colspan="2">17</td>
							<td class="graphMain bordered">18</td>
						</tr>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsForeign">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="25">Товары, изгтовленные (полученные) из иностранных товаров</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsForeign" mode="DocType6_table2"/>
						</xsl:if>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsMix">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="25">Товары, изгтовленные (полученные) с использованием иностранных товаров</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsMix" mode="DocType6_table2"/>
						</xsl:if>
						<xsl:if test="stz_ru:Table2/stz_ru:ProducedGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="25">Товары, изгтовленные из товаров ЕАЭС</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table2/stz_ru:ProducedGoodsGU" mode="DocType6_table2"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="table1_1">
		<xsl:choose>
			<xsl:when test="$DocType &lt; 6">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered">№ п/п</td>
							<td class="graphMain bordered">Наименование товара</td>
							<td class="graphMain bordered">№ таможенной декларации, в соответствии с которой товар был помещен под таможенную процедуру СТЗ, и № товара в такой таможенной декларации</td>
							<td class="graphMain bordered">Количество товара</td>
							<td class="graphMain bordered">Единица измерения количества товара</td>
							<td class="graphMain bordered">
								<xsl:choose>
									<xsl:when test="$DocType = 1 or $DocType = 2">
										Наименование товаров, изготовленных (полученных) на территории Особой экономической зоны (далее - ОЭЗ)
									</xsl:when>
									<xsl:when test="$DocType = 3">
										Наименование товаров, изготовленных (полученных) на территории свободной экономической зоны
									</xsl:when>
									<xsl:when test="$DocType = 4">
										Наименование товаров, изготовленных (полученных) на участке территории опережающего развития (далее - ТОР)
									</xsl:when>
									<xsl:when test="$DocType = 5">
										Наименование изготовленных (полученных) товаров
									</xsl:when>
								</xsl:choose>
							</td>
							<td class="graphMain bordered">
								<xsl:choose>
									<xsl:when test="$DocType = 1">
										Остаток товаров, в отношении которых не совершены операции по переработке, находящихся у лица (количество)
									</xsl:when>
									<xsl:when test="$DocType = 2">
										Остаток товаров, в отношении которых не совершены операции по переработке, находящихся у резидента ОЭЗ на отчетную дату (количество)
									</xsl:when>
									<xsl:when test="$DocType = 3">
										Остаток товаров, в отношении которых не совершены операции по переработке, находящиеся у участника свободной экономической зоны на отчетную дату (количество)
									</xsl:when>
									<xsl:when test="$DocType = 4">
										Остаток товаров, в отношении которых не совершены операции по переработке, находящиеся у резидента ТОР на отчетную дату (количество)
									</xsl:when>
									<xsl:when test="$DocType = 5">
										Остаток товаров, в отношении которых не совершены операции по переработке, на отчетную дату
									</xsl:when>
								</xsl:choose>
							</td>
						</tr>
						<tr align="center" valign="middle">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered">7</td>
						</tr>
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="31">Иностранные товары</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table11/stz_ru:RecyclingForeign" mode="DocType1-5_table1.1"/>
						<xsl:if test="stz_ru:Table11/stz_ru:RecyclingGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="31">Товары Евразийского экономического союза</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table11/stz_ru:RecyclingGU" mode="DocType1-5_table1.1"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
			<xsl:otherwise>
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">№ п/п</td>
							<td class="graphMain bordered" rowspan="2">Наименование вывезенного товара и его описание</td>
							<td class="graphMain bordered" rowspan="2">№ таможенной декларации / порядковый номер товара в таможенной декларации</td>
							<td class="graphMain bordered" rowspan="2">Количество вывезенных товаров</td>
							<td class="graphMain bordered" colspan="2">Вывезенные товары, в отношении которых процедура СТЗ завершена в соответствии с пунктом 4 статьи 6<sup>2</sup> Федерального закона от 31 мая 1999 г. № 104-ФЗ<sup>3</sup>
							</td>
							<td class="graphMain bordered" rowspan="2">Местонахождение вывезенного товара</td>
							<td class="graphMain bordered" colspan="3">Операции, совершаемые с вывезенными товарами в соответствии с пунктом 5 статьи 6<sup>2</sup> Федерального закона № 104-ФЗ</td>
							<td class="graphMain bordered" rowspan="2">Примечание (при наличии)</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">номер таможенной декларации</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">наименование операции</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">остаток</td>
						</tr>
						<tr align="center" valign="middle">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered" colspan="2">5</td>
							<td class="graphMain bordered">6</td>
							<td class="graphMain bordered" colspan="3">7</td>
							<td class="graphMain bordered">8</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table11_49" mode="DocType6_table1.1"/>
					</tbody>
				</table>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="table1">
		<xsl:choose>
			<xsl:when test="$DocType = 1">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара и его описание</td>
							<td class="graphMain bordered" rowspan="4">Код товара</td>
							<td class="graphMain bordered" rowspan="4">Единица измерения</td>
							<td class="graphMain bordered" rowspan="4">№ таможенной декларации/порядковый номер товара в таможенной декларации</td>
							<td class="graphMain bordered" rowspan="2" colspan="2">Товары, помещенные под таможенную процедуру свободной таможенной зоны (далее - СТЗ) (количество)</td>
							<td class="graphMain bordered" colspan="21">Распоряжение за отчетный период товарами, помещенными под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" colspan="2">Хранение товаров</td>
							<td class="graphMain bordered" rowspan="4">Примечание (при наличии)</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="3">товары, в отношении которых совершены операции по переработке в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза<sup>1</sup>
								<br/>(количество)</td>
							<td class="graphMain bordered" rowspan="3">товары, полностью израсходованные (потребленные) в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса ЕАЭС<br/>(количество)</td>
							<td class="graphMain bordered" colspan="2">потребление товаров в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">вывоз товаров без завершения таможенной процедуры СТЗ</td>
							<td class="graphMain bordered" colspan="2">создание объекта недвижимости</td>
							<td class="graphMain bordered" colspan="2">отбор проб и образцов</td>
							<td class="graphMain bordered" colspan="2">уничтожение товаров и упаковки</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="4">товары, в отношении которых процедура СТЗ завершена</td>
							<td class="graphMain bordered" colspan="3">передача товаров иному лицу</td>
							<td class="graphMain bordered" colspan="2"/>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">брутто</td>
							<td class="graphMain bordered" rowspan="2">нетто</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">дата и номер решения таможенного органа</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">реквизиты документа</td>
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры</td>
							<td class="graphMain bordered" rowspan="2">номер таможенной декларации</td>
							<td class="graphMain bordered" colspan="2">количество, единица измерения</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">наименование лица</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
							<td class="graphMain bordered" colspan="2">количество, единица измерения</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered" colspan="2">6</td>
							<td class="graphMain bordered">7</td>
							<td class="graphMain bordered">8</td>
							<td class="graphMain bordered" colspan="2">9</td>
							<td class="graphMain bordered" colspan="2">10</td>
							<td class="graphMain bordered" colspan="2">11</td>
							<td class="graphMain bordered" colspan="2">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="4">15</td>
							<td class="graphMain bordered" colspan="3">16</td>
							<td class="graphMain bordered" colspan="2">17</td>
							<td class="graphMain bordered">18</td>
						</tr>
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="31">Иностранные товары</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsForeign" mode="DocType1_table1"/>
						<xsl:if test="stz_ru:Table1/stz_ru:SEZGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="31">Товары Евразийского экономического союза</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsGU" mode="DocType1_table1"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="$DocType = 2">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара и его описание</td>
							<td class="graphMain bordered" rowspan="4">Код товара</td>
							<td class="graphMain bordered" rowspan="4">Единица измерения</td>
							<td class="graphMain bordered" rowspan="4">№ таможенной декларации/порядковый номер товара в таможенной декларации</td>
							<td class="graphMain bordered" colspan="9">Товары, помещенные под таможенную процедуру свободной таможенной зоны (далее - СТЗ) (количество)</td>
							<td class="graphMain bordered" colspan="23">Распоряжение за отчетный период товарами, помещенными под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="2" colspan="2">Хранение товаров</td>
							<td class="graphMain bordered" rowspan="4">Оборудование (количество)</td>
							<td class="graphMain bordered" rowspan="4">Примечание (при наличии)</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="3">на начало отчетного периода</td>
							<td class="graphMain bordered" colspan="3">за отчетный период</td>
							<td class="graphMain bordered" colspan="3">на конец отчетного периода</td>
							<td class="graphMain bordered" rowspan="3">товары, в отношении которых совершены операции по переработке в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза<sup>1</sup>
								<br/>(количество)</td>
							<td class="graphMain bordered" rowspan="3">товары, полностью израсходованные (потребленные) в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса ЕАЭС<br/>(количество)</td>
							<td class="graphMain bordered" colspan="2">потребление товаров в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">вывоз товаров без завершения таможенной процедуры СТЗ</td>
							<td class="graphMain bordered" colspan="2">создание объекта недвижимости</td>
							<td class="graphMain bordered" colspan="2">отбор проб и образцов</td>
							<td class="graphMain bordered" colspan="2">товары, вывезенные в соответствии с пунктом 3 подпункта 4 статьи 205 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">уничтожение товаров и упаковки</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="4">товары, в отношении которых процедура СТЗ завершена</td>
							<td class="graphMain bordered" colspan="3">передача товаров иному резидетну или иному лицу в соответствии с пунктами 8, 10 статьи 205 Таможенного кодекса ЕАЭС</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">брутто</td>
							<td class="graphMain bordered" rowspan="2">нетто</td>
							<td class="graphMain bordered" rowspan="2">упаковка</td>
							<td class="graphMain bordered" rowspan="2">брутто</td>
							<td class="graphMain bordered" rowspan="2">нетто</td>
							<td class="graphMain bordered" rowspan="2">упаковка</td>
							<td class="graphMain bordered" rowspan="2">брутто</td>
							<td class="graphMain bordered" rowspan="2">нетто</td>
							<td class="graphMain bordered" rowspan="2">упаковка</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ транзитной декларации</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры</td>
							<td class="graphMain bordered" rowspan="2">номер таможенной декларации</td>
							<td class="graphMain bordered" colspan="2">количество, основная единица измерения</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">наименование лица</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
							<td class="graphMain bordered" colspan="2">количество, основная единица измерения</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered" colspan="3">6</td>
							<td class="graphMain bordered" colspan="3">7</td>
							<td class="graphMain bordered" colspan="3">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered">10</td>
							<td class="graphMain bordered" colspan="2">11</td>
							<td class="graphMain bordered" colspan="2">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="2">15</td>
							<td class="graphMain bordered" colspan="2">16</td>
							<td class="graphMain bordered" colspan="2">17</td>
							<td class="graphMain bordered" colspan="4">18</td>
							<td class="graphMain bordered" colspan="3">19</td>
							<td class="graphMain bordered" colspan="2">20</td>
							<td class="graphMain bordered">21</td>
							<td class="graphMain bordered">22</td>
						</tr>
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="41">Иностранные товары</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsForeign" mode="DocType2_table1"/>
						<xsl:if test="stz_ru:Table1/stz_ru:SEZGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="41">Товары Евразийского экономического союза</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsGU" mode="DocType2_table1"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="$DocType = 3 or $DocType = 5">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара и его описание</td>
							<td class="graphMain bordered" rowspan="4">Код товара</td>
							<td class="graphMain bordered" rowspan="4">Единица измерения</td>
							<td class="graphMain bordered" rowspan="4">№ таможенной декларации/порядковый номер товара в таможенной декларации</td>
							<td class="graphMain bordered" colspan="6">Товары, помещенные под таможенную процедуру свободной таможенной зоны (далее - СТЗ) (количество)</td>
							<td class="graphMain bordered" colspan="23">Распоряжение за отчетный период товарами, помещенными под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="3" colspan="2">Хранение товаров</td>
							<td class="graphMain bordered" rowspan="4">Оборудование (количество)</td>
							<td class="graphMain bordered" rowspan="4">Примечание (при наличии)</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="2">на начало отчетного периода</td>
							<td class="graphMain bordered" colspan="2">за отчетный период</td>
							<td class="graphMain bordered" colspan="2">всего</td>
							<td class="graphMain bordered" rowspan="3">товары, в отношении которых совершены операции по переработке в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза<sup>1</sup>
								<br/>(количество)</td>
							<td class="graphMain bordered" rowspan="3">товары, полностью израсходованные (потребленные) в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса ЕАЭС<br/>(количество)</td>
							<td class="graphMain bordered" colspan="2">потребление товаров в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">вывоз товаров без завершения таможенной процедуры СТЗ</td>
							<td class="graphMain bordered" colspan="2">создание объекта недвижимости</td>
							<td class="graphMain bordered" colspan="2">отбор проб и образцов</td>
							<td class="graphMain bordered" colspan="2">товары, вывезенные в соответствии с пунктом 3 подпункта 4 статьи 205 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">уничтожение товаров и упаковки</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="4">товары, в отношении которых процедура СТЗ завершена</td>
							<td class="graphMain bordered" colspan="3">передача товаров иному участнику или иному лицу</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="2">нетто</td>
							<td class="graphMain bordered" rowspan="2">упаковка</td>
							<td class="graphMain bordered" rowspan="2">нетто</td>
							<td class="graphMain bordered" rowspan="2">упаковка</td>
							<td class="graphMain bordered" rowspan="2">нетто</td>
							<td class="graphMain bordered" rowspan="2">упаковка</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">наиманование объекта недвижимости</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ транзитной декларации</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры</td>
							<td class="graphMain bordered" rowspan="2">номер таможенной декларации</td>
							<td class="graphMain bordered" colspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">наименование лица</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered" colspan="2">6</td>
							<td class="graphMain bordered" colspan="2">7</td>
							<td class="graphMain bordered" colspan="2">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered">10</td>
							<td class="graphMain bordered" colspan="2">11</td>
							<td class="graphMain bordered" colspan="2">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="2">15</td>
							<td class="graphMain bordered" colspan="2">16</td>
							<td class="graphMain bordered" colspan="2">17</td>
							<td class="graphMain bordered" colspan="4">18</td>
							<td class="graphMain bordered" colspan="3">19</td>
							<td class="graphMain bordered" colspan="2">20</td>
							<td class="graphMain bordered">21</td>
							<td class="graphMain bordered">22</td>
						</tr>
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="38">Иностранные товары</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsForeign" mode="DocType35_table1"/>
						<xsl:if test="stz_ru:Table1/stz_ru:SEZGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="38">Товары Евразийского экономического союза</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsGU" mode="DocType35_table1"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="$DocType = 4">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара и его описание</td>
							<td class="graphMain bordered" rowspan="4">Код товара</td>
							<td class="graphMain bordered" rowspan="4">Единица измерения</td>
							<td class="graphMain bordered" rowspan="4">№ таможенной декларации/порядковый номер товара в таможенной декларации</td>
							<td class="graphMain bordered" colspan="6">Товары, помещенные под таможенную процедуру свободной таможенной зоны (далее - СТЗ) (количество)</td>
							<td class="graphMain bordered" colspan="33">Распоряжение за отчетный период товарами, помещенными под таможенную процедуру СТЗ</td>
							<td class="graphMain bordered" rowspan="3" colspan="2">Хранение товаров</td>
							<td class="graphMain bordered" rowspan="4">Оборудование (количество)</td>
							<td class="graphMain bordered" rowspan="4">Примечание (при наличии)</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="2" rowspan="2">на начало отчетного периода</td>
							<td class="graphMain bordered" colspan="2" rowspan="2">за отчетный период</td>
							<td class="graphMain bordered" colspan="2" rowspan="2">всего</td>
							<td class="graphMain bordered" rowspan="3">товары, в отношении которых совершены операции по переработке в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса Евразийского экономического союза<sup>1</sup>
								<br/>(количество)</td>
							<td class="graphMain bordered" rowspan="3">товары, полностью израсходованные (потребленные) в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса ЕАЭС<br/>(количество)</td>
							<td class="graphMain bordered" colspan="6">товары, потребленные в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="10">вывоз товаров без завершения таможенной процедуры СТЗ</td>
							<td class="graphMain bordered" colspan="2">отбор проб и образцов</td>
							<td class="graphMain bordered" colspan="2">уничтожение товаров и упаковки</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="4">товары, в отношении которых процедура СТЗ завершена</td>
							<td class="graphMain bordered" colspan="3">передача товаров иному резиденту</td>
							<td class="graphMain bordered" colspan="2">создание объекта недвижимости</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="2">эксплуатация объектов недвижимости</td>
							<td class="graphMain bordered" colspan="2">эксплуатация оборудования</td>
							<td class="graphMain bordered" colspan="2">исследования, испытания</td>
							<td class="graphMain bordered" colspan="2">ремонт</td>
							<td class="graphMain bordered" colspan="2">технические испытания</td>
							<td class="graphMain bordered" colspan="2">другой таможенный орган</td>
							<td class="graphMain bordered" colspan="2">собственные производственные нужды</td>
							<td class="graphMain bordered" colspan="2">переработка / изготовление</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">№ разрешения</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">реквизиты документов</td>
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры</td>
							<td class="graphMain bordered" rowspan="2">номер таможенной декларации</td>
							<td class="graphMain bordered" colspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">наименование лица</td>
							<td class="graphMain bordered" rowspan="2">№ и дата документа</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">наименование объектов недвижимости</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">нетто</td>
							<td class="graphMain bordered">упаковка</td>
							<td class="graphMain bordered">нетто</td>
							<td class="graphMain bordered">упаковка</td>
							<td class="graphMain bordered">нетто</td>
							<td class="graphMain bordered">упаковка</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">№ разрешения</td>
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
							<td class="graphMain bordered">брутто</td>
							<td class="graphMain bordered">нетто</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered">5</td>
							<td class="graphMain bordered" colspan="2">6</td>
							<td class="graphMain bordered" colspan="2">7</td>
							<td class="graphMain bordered" colspan="2">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered">10</td>
							<td class="graphMain bordered" colspan="6">11</td>
							<td class="graphMain bordered" colspan="10">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="2">15</td>
							<td class="graphMain bordered" colspan="4">16</td>
							<td class="graphMain bordered" colspan="3">17</td>
							<td class="graphMain bordered" colspan="2">18</td>
							<td class="graphMain bordered" colspan="2">19</td>
							<td class="graphMain bordered">20</td>
							<td class="graphMain bordered">21</td>
						</tr>
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="48">Иностранные товары</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsForeign" mode="DocType4_table1"/>
						<xsl:if test="stz_ru:Table1/stz_ru:SEZGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="48">Товары Евразийского экономического союза</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsGU" mode="DocType4_table1"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
			<xsl:when test="$DocType = 6">
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="graphMain bordered" rowspan="4">№ п/п</td>
							<td class="graphMain bordered" rowspan="4">Наименование товара и его описание</td>
							<td class="graphMain bordered" rowspan="4">Единица измерения</td>
							<td class="graphMain bordered" rowspan="4">№ таможенной декларации/порядковый номер товара в таможенной декларации</td>
							<td class="graphMain bordered" colspan="6">Товары, помещенные под таможенную процедуру свободной таможенной зоны (далее - СТЗ) (количество)</td>
							<td class="graphMain bordered" colspan="29">Распоряжение товарами за отчетный период</td>
							<td class="graphMain bordered" rowspan="3" colspan="2">Хранение товаров</td>
							<td class="graphMain bordered" rowspan="4">Примечание (при наличии)</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="2" rowspan="2">на начало отчетного периода</td>
							<td class="graphMain bordered" colspan="2" rowspan="2">за отчетный период</td>
							<td class="graphMain bordered" colspan="2" rowspan="2">всего</td>
							<td class="graphMain bordered" rowspan="3">товары, в отношении которых совершены операции по переработке (обработке)</td>
							<td class="graphMain bordered" rowspan="3">товары, полностью израсходованные (потребленные) в соответствии с подпунктом 4 пункта 1 статьи 205 Таможенного кодекса ЕАЭС<sup>1</sup>
							</td>
							<td class="graphMain bordered" colspan="2" rowspan="2">товары, потребленные в соответствии с подпунктом 5 пункта 1 статьи 205 и пунктом 3 статьи 455 Таможенного кодекса ЕАЭС</td>
							<td class="graphMain bordered" colspan="10">вывоз товаров без завершения таможенной процедуры СТЗ</td>
							<td class="graphMain bordered" colspan="2">отбор проб и образцов</td>
							<td class="graphMain bordered" colspan="2">уничтожение товаров</td>
							<td class="graphMain bordered" colspan="2">товары, пришедшие в негодность</td>
							<td class="graphMain bordered" colspan="4">товары, в отношении которых процедура СТЗ завершена</td>
							<td class="graphMain bordered" colspan="3">передача товаров иному лицу</td>
							<td class="graphMain bordered" colspan="2">создание объекта недвижимости</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered" colspan="2">в соответствии с подпунктом 1 пункта 4 статьи 205 ТК ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">в соответствии с подпунктом 2 пункта 4 статьи 205 ТК ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">в соответствии с подпунктом 3 пункта 4 статьи 205 ТК ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">в соответствии с пунктом  7 статьи 455 ТК ЕАЭС</td>
							<td class="graphMain bordered" colspan="2">в соответствии с подпунктом 5 пункта 4 статьи 205 ТК ЕАЭС</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">номер разрешения таможенного органа</td>
							<td class="graphMain bordered" rowspan="2">вес нетто</td>
							<td class="graphMain bordered" rowspan="2">номер и дата решения таможенного органа</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">номер и дата документа</td>
							<td class="graphMain bordered" rowspan="2">код таможенной процедуры</td>
							<td class="graphMain bordered" rowspan="2">номер таможенной декларации</td>
							<td class="graphMain bordered" colspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">лицо которому переданы товары</td>
							<td class="graphMain bordered" rowspan="2">номер и дата документа</td>
							<td class="graphMain bordered" rowspan="2">количество</td>
							<td class="graphMain bordered" rowspan="2">номер и дата документа</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">вес нетто</td>
							<td class="graphMain bordered">вес брутто</td>
							<td class="graphMain bordered">вес нетто</td>
							<td class="graphMain bordered">вес брутто</td>
							<td class="graphMain bordered">вес нетто</td>
							<td class="graphMain bordered">вес брутто</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер и дата документа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер разрешения таможенного органа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер разрешения таможенного органа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер разршенеия таможенного органа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер разршенеия таможенного органа</td>
							<td class="graphMain bordered">количество</td>
							<td class="graphMain bordered">номер разршенеия таможенного органа</td>
							<td class="graphMain bordered">вес брутто</td>
							<td class="graphMain bordered">вес нетто</td>
							<td class="graphMain bordered">вес брутто</td>
							<td class="graphMain bordered">вес нетто</td>
						</tr>
						<tr align="center" valign="top">
							<td class="graphMain bordered">1</td>
							<td class="graphMain bordered">2</td>
							<td class="graphMain bordered">3</td>
							<td class="graphMain bordered">4</td>
							<td class="graphMain bordered" colspan="2">5</td>
							<td class="graphMain bordered" colspan="2">6</td>
							<td class="graphMain bordered" colspan="2">7</td>
							<td class="graphMain bordered">8</td>
							<td class="graphMain bordered">9</td>
							<td class="graphMain bordered" colspan="2">10</td>
							<td class="graphMain bordered" colspan="10">11</td>
							<td class="graphMain bordered" colspan="2">12</td>
							<td class="graphMain bordered" colspan="2">13</td>
							<td class="graphMain bordered" colspan="2">14</td>
							<td class="graphMain bordered" colspan="4">15</td>
							<td class="graphMain bordered" colspan="3">16</td>
							<td class="graphMain bordered" colspan="2">17</td>
							<td class="graphMain bordered" colspan="2">18</td>
							<td class="graphMain bordered">19</td>
						</tr>
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="42">Иностранные товары</td>
						</tr>
						<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsForeign" mode="DocType6_table1"/>
						<xsl:if test="stz_ru:Table1/stz_ru:SEZGoodsGU">
							<tr align="left" valign="top">
								<td class="graphMain bordered" colspan="42">Товары Евразийского экономического союза</td>
							</tr>
							<xsl:apply-templates select="stz_ru:Table1/stz_ru:SEZGoodsGU" mode="DocType6_table1"/>
						</xsl:if>
					</tbody>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="title_sheet">
		<table>
			<tbody>
				<tr>
					<td align="center" class="title">
						<font size="4">
							<b>
								<xsl:text>ОТЧЕТНОСТЬ</xsl:text>
								<br/>
								<xsl:text>о товарах, помещенных под таможенную процедуру</xsl:text>
								<br/>
								<xsl:text>свободной таможенной зоны, применяемую на </xsl:text>
								<xsl:choose>
									<xsl:when test="$DocType = 1">
										территории Особой экономической зоны в Калининградской обсласти, и товарах, изговтовленных (полученных) из иностранных товаров, помещенных под такую таможенную процедуру
									</xsl:when>
									<xsl:when test="$DocType = 2">
										территории особой экономической зоны, созданной в соответствии с Федеральным законом от 22 июля 2005 г., № 116-ФЗ "Об особых экономических зонах в Российской Федерации", и товарах, извготовленных (полученных) из товаров, помещенных под указанную таможенную процедуру свободной таможенной зоны, а так же об операциях, совершаемых с такими товарами,
									</xsl:when>
									<xsl:when test="$DocType = 3">
										территории свободной экономической зоны на территориях Республики Крым и городе федерального значения Севастополя, и товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, применяемую на территории свободной экономической зоны на территориях Республики Крым и города федерального значения Севастополя
									</xsl:when>
									<xsl:when test="$DocType = 4">
										участках территории опережающего развития, и о товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, применяемую на участках территории опережающего развития
									</xsl:when>
									<xsl:when test="$DocType = 5">
										территории свободного порта Владивосток, и товарах, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, применяемую на территории свободного порта Владивосток
									</xsl:when>
									<xsl:when test="$DocType = 6">
										территории Особой экономической зоны в Магаданской области и на территории Южно-Курильского, Курильского и Северо-Курильского городских округов Сахалинской области, и товарах, изготовленных (полученных) с использованием иностранных товаров, помещенных под такую таможенную процедуру
									</xsl:when>
								</xsl:choose>
							</b>
						</font>
					</td>
				</tr>
				<xsl:if test="$DocType = 4">
					<tr>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td style="border-top: 1px solid black; font-size: 8pt;" align="center">(наименование территории опережающего развития)</td>
					</tr>
				</xsl:if>
				<tr>
					<td align="center">
						<xsl:if test="$DocType &lt; 6">
							<xsl:text>за период </xsl:text>
						</xsl:if>
						<xsl:text>c </xsl:text>
						<xsl:apply-templates select="stz_ru:ReportingPeriod/stz_ru:StartDate" mode="month_date"/>
						<xsl:text> по </xsl:text>
						<xsl:apply-templates select="stz_ru:ReportingPeriod/stz_ru:EndDate" mode="month_date"/>
						<xsl:if test="$DocType &lt; 6">
							<br/>
							<xsl:text>по состоянию на </xsl:text>
							<xsl:apply-templates select="stz_ru:ReportingPeriod/stz_ru:StateDate" mode="month_date"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
						<br/>
						<xsl:if test="$DocType &lt; 6">от </xsl:if>
						<xsl:apply-templates select="stz_ru:Resident"/>
					</td>
				</tr>
				<tr>
					<td style="border-top: 1px solid black; font-size: 8pt;" align="center">
						<xsl:choose>
							<xsl:when test="$DocType = 1">(наименование организации, содержащее указание на ее организационно-правовую форму), основной государственный регистрационный номер, идентификационный номер налогоплательщика, код причины поставновки на учет в налоговом органе, место нахождения и адрес в пределах места нахождения юридического лица; реквизиты свидетельства о включении в реестр резидентов особой экономической зоны (при наличии)</xsl:when>
							<xsl:when test="$DocType = 2 or $DocType = 3">(наименование организации, содержащее указание на ее организационно-правовую форму, основной государственный регистрационный номер, идентификационный номер налогоплательщика, код причины постановки на учет, место нахождения и адрес в пределах места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), адрес места жительства или адрес регистрации по месту пребывания либо месту жительства физического лица, идентификационный номер налогоплательщика, основной государственный регистрационный номер индивидуального предпринимателя и сведения о документе, удостоверяющем личность физического лица (серия, номер, дата выдачи) - для физического лица; реквизиты свидетельства о включении в реестр резидентов особой экономической зоны (при наличии)</xsl:when>
							<xsl:when test="$DocType = 4">(наименование организации, содержащее указание на ее организационно-правовую форму, основной государственный регистрационный номер, идентификационный номер налогоплательщика, код причины постановки на учет, место нахождения и адрес в пределах места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), адрес места жительства или адрес регистрации по месту пребывания либо месту жительства физического лица, идентификационный номер налогоплательщика, основной государственный регистрационный номер индивидуального предпринимателя и сведения о документе, удостоверяющем личность физического лица (серия, номер, дата выдачи) - для физического лица; реквизиты свидетельства о включении в реестр резидентов территории опережающего развития (при наличии)</xsl:when>
							<xsl:when test="$DocType = 5">(наименование организации, содержащее указание на ее организационно-правовую форму, основной государственный регистрационный номер, идентификационный номер налогоплательщика, код причины постановки на учет, место нахождения и адрес в пределах места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), адрес места жительства или адрес регистрации по месту пребывания либо месту жительства физического лица, идентификационный номер налогоплательщика, основной государственный регистрационный номер индивидуального предпринимателя и сведения о документе, удостоверяющем личность физического лица (серия, номер, дата выдачи) - для физического лица; реквизиты свидетельства о включении в реестр резидентов свободного порта Владивосток (при наличии)</xsl:when>
							<xsl:when test="$DocType = 6">(наименование организации, содержащее указание на ее организационно-правовую форму, основной государственный регистрационный номер, идентификационный номер налогоплательщика, код причины постановки на учет, место нахождения и адрес в пределах места нахождения юридического лица - для юридического лица; фамилия, имя, отчество (при наличии), адрес места жительства или адрес регистрации по месту пребывания либо месту жительства физического лица, идентификационный номер налогоплательщика, основной государственный регистрационный номер индивидуального предпринимателя и сведения о документе, удостоверяющем личность физического лица (серия, номер, дата выдачи) - для физического лица; реквизиты регистрационного свидетельства, подтверждающего  статус участника Особой экономической зоны в Магаданской области и на территориях Южно-Курильсого, Курильского и Северо-Курильского городских округов Сахалинской области (при наличии)</xsl:when>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td align="center">
						<br/>
						<br/>
						<xsl:apply-templates select="stz_ru:ReportPerson"/>
					</td>
				</tr>
				<tr>
					<td style="border-top: 1px solid black; font-size: 8pt;" align="center">
						(фамилия, имя, отчество (при наличии), подпись лица, составившего отчетность, дата составления)
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<!-- ТАБЛИЦА 1 -->
	<xsl:template match="stz_ru:SEZGoodsForeign|stz_ru:SEZGoodsGU" mode="DocType1_table1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Measure1" mode="measure"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:DT"/>
				<xsl:apply-templates select="stz_ru:TUGoods"/>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:NetWeight"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:RecycledGoods"/>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ConsumedGoods"/>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsProcedure">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsDoc/stz_ru:GTDID">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:GrossWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 17 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
			<!-- 18 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Comments"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stz_ru:SEZGoodsForeign|stz_ru:SEZGoodsGU" mode="DocType2_table1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Measure1" mode="measure"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:DT"/>
				<xsl:apply-templates select="stz_ru:TUGoods"/>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:PackWeight"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:PackWeight"/>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:PackWeight"/>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:RecycledGoods"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ConsumedGoods"/>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransitGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransitGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 17 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 18 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsProcedure">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsDoc/stz_ru:GTDID">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:GrossWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 19 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 20 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
			<!-- 21 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:EquipmentGoods/stz_ru:ArticleWeight"/>
			</td>
			<!-- 22 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Comments"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stz_ru:SEZGoodsForeign|stz_ru:SEZGoodsGU" mode="DocType35_table1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Measure1" mode="measure"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:DT"/>
				<xsl:apply-templates select="stz_ru:TUGoods"/>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:PackWeight"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:PackWeight"/>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:PackWeight"/>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:RecycledGoods"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ConsumedGoods"/>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransitGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransitGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 17 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 18 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsProcedure">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsDoc/stz_ru:GTDID">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:GrossWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 19 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 20 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
			<!-- 21 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:EquipmentGoods/stz_ru:ArticleWeight"/>
			</td>
			<!-- 22 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Comments"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stz_ru:SEZGoodsForeign|stz_ru:SEZGoodsGU" mode="DocType4_table1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Measure1" mode="measure"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:DT"/>
				<xsl:apply-templates select="stz_ru:TUGoods"/>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:PackWeight"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:PackWeight"/>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:PackWeight"/>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:RecycledGoods"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ConsumedGoods"/>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods[stz_ru:ConsumeType = 1]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods[stz_ru:ConsumeType = 1]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods[stz_ru:ConsumeType = 2]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods[stz_ru:ConsumeType = 2]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods[stz_ru:ConsumeType = 3]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods[stz_ru:ConsumeType = 3]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 1]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 1]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 2]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 2]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 3]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 3]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 4]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 4]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 5]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 5]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsProcedure">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsDoc/stz_ru:GTDID">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:GrossWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 17 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 18 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:PropertyName">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 19 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
			<!-- 20 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:EquipmentGoods/stz_ru:ArticleWeight"/>
			</td>
			<!-- 21 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Comments"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stz_ru:SEZGoodsForeign|stz_ru:SEZGoodsGU" mode="DocType6_table1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Measure1" mode="measure"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:DT"/>
				<xsl:apply-templates select="stz_ru:TUGoods"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightStart/stz_ru:PackWeight"/>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightDiff/stz_ru:PackWeight"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:NetWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:WeightEnd/stz_ru:PackWeight"/>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:RecycledGoods"/>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ConsumedGoods"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 1]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 1]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 2]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 2]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 3]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 3]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 4]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 4]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 5]/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods[stz_ru:ExportPurpose = 5]/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DestroyedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsProcedure">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:CustomsDoc/stz_ru:GTDID">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:GrossWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DTGoods/stz_ru:GoodsQuantity/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 17 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 18 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
			<!-- 19 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Comments"/>
			</td>
		</tr>
	</xsl:template>
	<!-- /ТАБЛИЦА 1 -->
	
	<!-- ТАБЛИЦА 1.1 -->
	<xsl:template match="stz_ru:RecyclingForeign|stz_ru:RecyclingGU" mode="DocType1-5_table1.1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:DT"/>
				<xsl:apply-templates select="stz_ru:TUGoods"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Quantity/stz_ru:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				</xsl:for-each>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Quantity/stz_ru:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				</xsl:for-each>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered" align="left">
				<xsl:for-each select="stz_ru:ProducedName">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:value-of select="position()"/>
					<xsl:text>. </xsl:text>
					<xsl:apply-templates select="stz_ru:NameGoods"/>
				</xsl:for-each>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stz_ru:Table11_49" mode="DocType6_table1.1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:DT"/>
				<xsl:apply-templates select="stz_ru:TUGoods"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Quantity/stz_ru:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				</xsl:for-each>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ExportedGoodsCloseSTZ/stz_ru:CustomsDoc/stz_ru:GTDID" mode="reg_num"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ExportedGoodsCloseSTZ/stz_ru:GoodsQuantity/stz_ru:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="quantity"/>
				</xsl:for-each>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered" align="left">
				<xsl:apply-templates select="stz_ru:GoodsPlace" mode="address"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ExportedGoodsOperations">
					<xsl:if test="position()!=1">
						<br/>
						<br/>
					</xsl:if>
					<xsl:value-of select="position()"/>
					<xsl:text>. </xsl:text>
					<xsl:apply-templates select="stz_ru:OperationName"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ExportedGoodsOperations">
					<xsl:if test="position()!=1">
						<br/>
						<br/>
					</xsl:if>
					<xsl:value-of select="position()"/>
					<xsl:text>. </xsl:text>
					<xsl:apply-templates select="stz_ru:GoodsQuantity"/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ExportedGoodsOperations">
					<xsl:if test="position()!=1">
						<br/>
						<br/>
					</xsl:if>
					<xsl:value-of select="position()"/>
					<xsl:text>. </xsl:text>
					<xsl:apply-templates select="stz_ru:GoodsLeft"/>
				</xsl:for-each>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered" align="left">
				<xsl:apply-templates select="stz_ru:Comments"/>
			</td>
		</tr>
	</xsl:template>
	<!-- /ТАБЛИЦА 1.1 -->
	
	<!-- ТАБЛИЦА 2. -->
	<xsl:template match="stz_ru:ProducedGoodsForeign|stz_ru:ProducedGoodsMix|stz_ru:ProducedGoodsGU" mode="DocType1_table2">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:QuantityAll/stz_ru:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				</xsl:for-each>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:QuantityAll/stz_ru:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				</xsl:for-each>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:CustomsModeCode"/>
				</xsl:for-each>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:DT/stz_ru:GTDID" mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:for-each select="stz_ru:Quantity/stz_ru:Quantity">
						<xsl:if test="position() != 1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="." mode="quantity"/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:IdentDoc" mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ConsumedGoods"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stz_ru:ProducedGoodsForeign|stz_ru:ProducedGoodsMix|stz_ru:ProducedGoodsGU" mode="DocType2_table2">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:QuantityAll/stz_ru:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				</xsl:for-each>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:QuantityAll/stz_ru:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				</xsl:for-each>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:CustomsModeCode"/>
				</xsl:for-each>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:DT/stz_ru:GTDID" mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:for-each select="stz_ru:Quantity/stz_ru:Quantity">
						<xsl:if test="position() != 1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="." mode="quantity"/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:IdentDoc" mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ConsumedGoods"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransitGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransitGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:GrossWeight"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stz_ru:ProducedGoodsForeign|stz_ru:ProducedGoodsMix|stz_ru:ProducedGoodsGU" mode="DocType3-5_table2">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:QuantityAll/stz_ru:Quantity/catESAD_cu:MeasureUnitQualifierName"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:QuantityBefore/stz_ru:Quantity/catESAD_cu:GoodsQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:QuantityDuring/stz_ru:Quantity/catESAD_cu:GoodsQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:QuantityAll/stz_ru:Quantity/catESAD_cu:GoodsQuantity"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:CustomsModeCode"/>
				</xsl:for-each>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:DT/stz_ru:GTDID" mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:for-each select="stz_ru:Quantity/stz_ru:Quantity">
						<xsl:if test="position() != 1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="." mode="quantity"/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:IdentDoc" mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ConsumedGoods"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransitGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransitGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stz_ru:ProducedGoodsForeign|stz_ru:ProducedGoodsMix|stz_ru:ProducedGoodsGU" mode="DocType6_table2">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:QuantityBefore/stz_ru:Quantity/catESAD_cu:GoodsQuantity"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:QuantityDuring/stz_ru:Quantity/catESAD_cu:GoodsQuantity"/>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:QuantityAll/stz_ru:Quantity/catESAD_cu:GoodsQuantity"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:CustomsModeCode"/>
				</xsl:for-each>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:DT/stz_ru:GTDID" mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:for-each select="stz_ru:Quantity/stz_ru:Quantity">
						<xsl:if test="position() != 1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="." mode="quantity"/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:Procedure">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:IdentDoc" mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherConsumedGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<!-- должно быть RecycledGoods, в схеме нет -->
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:PropertyCreateGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:NetWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:DisrepairGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:ResearchGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_ru:OrganizationName"/>
					<xsl:if test="stz_ru:INN">
						<xsl:text> ИНН </xsl:text>
						<xsl:apply-templates select="stz_ru:INN"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransferGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 17 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:Quantity/stz_ru:ArticleWeight">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:OtherExportGoods/stz_ru:CustomsDoc">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="doc"/>
				</xsl:for-each>
			</td>
			<!-- 18 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:LeftGoods/stz_ru:NetWeight"/>
			</td>
		</tr>
	</xsl:template>
	<!-- /ТАБЛИЦА 2. -->
	
	<!-- ТАБЛИЦА 3. -->
	<xsl:template match="stz_ru:TransportMeans" mode="DocType1_table3_1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TransportName"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<!-- номер ДТ -->
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransportRent/stz_ru:PersonInfo/*[contains(local-name(), 'ame')]">
					<xsl:if test="position() != 1">
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:if test="stz_ru:TransportRent/stz_ru:RentBegin">
					<xsl:text>c </xsl:text>
					<xsl:apply-templates select="stz_ru:TransportRent/stz_ru:RentBegin" mode="russian_date"/>
				</xsl:if>
				<xsl:if test="stz_ru:TransportRent/stz_ru:RentEnd">
					<xsl:text> по </xsl:text>
					<xsl:apply-templates select="stz_ru:TransportRent/stz_ru:RentEnd" mode="russian_date"/>
				</xsl:if>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransportAlienation/stz_ru:PersonInfo/*[contains(local-name(), 'ame')]">
					<xsl:if test="position() != 1">
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TransportAlienation/stz_ru:AlienationDate" mode="russian_date"/>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TransportAlienation/stz_ru:AlienationDoc" mode="doc"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TransportClosedSTZ/stz_ru:CustomsProcedure"/>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TransportClosedSTZ/stz_ru:CustomsDoc" mode="reg_num"/>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_ru:TransportUtilization/stz_ru:ValueAmount/*">
					<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TransportUtilization/stz_ru:UtilizationDoc" mode="doc"/>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered" align="left">
				<xsl:apply-templates select="stz_ru:TransportPlace" mode="address"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="stz_ru:TransportMeansUse" mode="DocType1_table3_2">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:for-each select="*[local-name() = 'Mark' or local-name() = 'MarkCode' or local-name() = 'Model']">
					<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:VINID"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:CustomsDoc" mode="reg_num"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:TransportIdentifier"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:DepartureDate" mode="russian_date"/>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:Route"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:ArriveDate" mode="russian_date"/>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_ru:CustomsBorderDoc" mode="doc"/>
			</td>
		</tr>
	</xsl:template>
	<!-- /ТАБЛИЦА 3. -->
	
	
	<xsl:template match="stz_ru:Route">
		<xsl:for-each select="*[local-name() != 'Airport']">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:if test="catTrans_ru:Airport">
			<xsl:for-each select="catTrans_ru:Airport/*">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
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
	<xsl:template match="stz_ru:ConsumedGoods|stz_ru:RecycledGoods|stz_ru:LeftGoods|stz_ru:GoodsQuantity|stz_ru:GoodsLeft">
		<xsl:if test="stz_ru:ArticleWeight">
			<xsl:apply-templates select="stz_ru:ArticleWeight"/>
			<xsl:text> кг</xsl:text>
		</xsl:if>
		<xsl:if test="stz_ru:Quantity and stz_ru:ArticleWeight">
			<br/>
		</xsl:if>
		<xsl:for-each select="stz_ru:Quantity">
			<xsl:if test="position() != 1">
				<br/>
			</xsl:if>
			<xsl:apply-templates select="." mode="quantity"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template match="stz_ru:TUGoods">
		<xsl:apply-templates select="stz_ru:CustomsDoc" mode="doc"/>
		<xsl:text> / </xsl:text>
		<xsl:apply-templates select="stz_ru:GoodsNumeric"/>
	</xsl:template>
	<xsl:template match="stz_ru:DT">
		<xsl:apply-templates select="stz_ru:GTDID" mode="reg_num"/>
		<xsl:text> / </xsl:text>
		<xsl:apply-templates select="stz_ru:GoodsNumeric"/>
	</xsl:template>
	<xsl:template match="*" mode="measure">
		<xsl:apply-templates select="stz_ru:MeasureUnitQualifierName"/>
	</xsl:template>
	<xsl:template match="stz_ru:GoodsItem">
		<xsl:apply-templates select="stz_ru:NameGoods"/>
		<xsl:for-each select="*[local-name() != 'NameGoods']">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="stz_ru:ReportPerson">
		<xsl:for-each select="*[contains(local-name(), 'ame')]">
			<xsl:if test="position() != 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<span style="display: inline-block;width: 50mm;"/>
		<xsl:apply-templates select="*[local-name() = 'IssueDate']" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="stz_ru:Resident">
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
		<xsl:apply-templates select="stz_ru:ResidentCertificate"/>
	</xsl:template>
	<xsl:template match="stz_ru:ResidentCertificate">
		<xsl:text>, свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="stz_ru:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="stz_ru:CertificateDate" mode="russian_date"/>
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
	<xsl:template name="month_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<span style="display: inline-block; width: 10mm; border-bottom: 1px solid black; text-align: center;">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<xsl:text>" </xsl:text>
				<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black; text-align: center;">
					<xsl:variable name="month" select="number(substring($dateIn,6,2))"/>
					<xsl:choose>
						<xsl:when test="$month = 1">января</xsl:when>
						<xsl:when test="$month = 2">февраля</xsl:when>
						<xsl:when test="$month = 3">марта</xsl:when>
						<xsl:when test="$month = 4">апреля</xsl:when>
						<xsl:when test="$month = 5">мая</xsl:when>
						<xsl:when test="$month = 6">июня</xsl:when>
						<xsl:when test="$month = 7">июля</xsl:when>
						<xsl:when test="$month = 8">августа</xsl:when>
						<xsl:when test="$month = 9">сентября</xsl:when>
						<xsl:when test="$month = 10">октября</xsl:when>
						<xsl:when test="$month = 11">ноября</xsl:when>
						<xsl:when test="$month = 12">декабря</xsl:when>
					</xsl:choose>
				</span>
				<xsl:text> 20</xsl:text>
				<span style="display: inline-block; width: 10mm; border-bottom: 1px solid black; text-align: center;">
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</span>
				<xsl:text>г. </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='STZ_RU_Report']//*" priority="-1">
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
	<xsl:template match="*" mode="month_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="month_date">
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
