<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cltESAD_ru="urn:customs.ru:RUCommonLeafTypes:5.4.0" xmlns:stz_rarc="urn:customs.ru:Information:CustomsDocuments:STZ_ReportArctic:5.28.0">
  <xsl:template match="stz_rarc:STZ_ReportArctic">
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
				<div class="page" style="width: {($w + 20) * 2 - 20}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<b>
										Раздел 2. Товары, изготовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободной таможенной зоны, и исползование таких товаров
									</b>
								</td>
							</tr>
							<tr>
								<td><br/><br/>Таблица 1</td>
							</tr>
							<tr>
								<td>Товары, изготовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободной таможенной зоны</td>
							</tr>
						</tbody>
					</table>
					<xsl:call-template name="table2_1"/>
					<!-- Таблица 2.1 Контекст - корневой узел -->
				</div>
				<div class="page" style="width: {($w + 20) * 2 - 20}mm;">
					<table>
						<tbody>
							<tr>
								<td>Таблица 2</td>
							</tr>
							<tr>
								<td>Использование товаров, изготовленных (полученных) на территории участка резидента Арктической зоны Российской Федерации с использованием товаров, помещенных под таможенную процедуру свободной таможенной зоны</td>
							</tr>
						</tbody>
					</table>
					<xsl:call-template name="table2_2"/>
					<!-- Таблица 2.2 Контекст - корневой узел -->
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="table2_2">
		<table>
			<tbody>
				<tr align="center" valign="top">
					<td class="graphMain bordered" rowspan="3">№ п/п</td>
					<td class="graphMain bordered" rowspan="3">Наименование товара</td>
					<td class="graphMain bordered" rowspan="3">Код товара по ТН ВЭД ЕАЭС</td>
					<td class="graphMain bordered" rowspan="3">Единица измерения</td>
					<td class="graphMain bordered" colspan="3">Количество</td>
					<td class="graphMain bordered" colspan="7">Распоряжение товарами</td>
				</tr>
				<tr align="center" valign="top">
					<td class="graphMain bordered" rowspan="2">на начало отчетного периода</td>
					<td class="graphMain bordered" rowspan="2">за отчетный период</td>
					<td class="graphMain bordered" rowspan="2">на конец отчетного периода</td>
					<td class="graphMain bordered" colspan="5">помещение подтаможенную процедуру</td>
					<td class="graphMain bordered" colspan="2">иное</td>
				</tr>
				<tr align="center" valign="top">
					<td class="graphMain bordered">код таможенной процедуры</td>
					<td class="graphMain bordered">статус товара</td>
					<td class="graphMain bordered">номер и дата заключения</td>
					<td class="graphMain bordered">номер таможенной декларации</td>
					<td class="graphMain bordered">количество/единица измерения</td>
					<td class="graphMain bordered">количество</td>
					<td class="graphMain bordered">примечание</td>
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
				<xsl:apply-templates select="stz_rarc:Table22"/>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="table2_1">
		<table>
			<tbody>
				<tr align="center" valign="top">
					<td rowspan="2" class="graphMain bordered">№ п/п</td>
					<td rowspan="2" class="graphMain bordered">Наименование товара</td>
					<td rowspan="2" class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
					<td rowspan="2" class="graphMain bordered">Статус товара</td>
					<td colspan="3" class="graphMain bordered">Нормы выхода / нормы расхода</td>
				</tr>
				<tr align="center" valign="top">
					<td class="graphMain bordered">Количество</td>
					<td class="graphMain bordered">Единица измерения</td>
					<td class="graphMain bordered">Номер документа</td>
				</tr>
				<tr align="center" valign="top">
					<td class="graphMain bordered">1</td>
					<td class="graphMain bordered">2</td>
					<td class="graphMain bordered">3</td>
					<td class="graphMain bordered">4</td>
					<td class="graphMain bordered">5</td>
					<td class="graphMain bordered">6</td>
					<td class="graphMain bordered">7</td>
				</tr>
				<xsl:for-each select="stz_rarc:Table21">
					<xsl:variable name="pos" select="position()"/>
					<xsl:if test="stz_rarc:ProducedGoodsMix">
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="7">
								<xsl:text>Товары, изгтовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободной таможенной зоны</xsl:text>
							</td>
						</tr>
						<xsl:apply-templates select="stz_rarc:ProducedGoodsMix" mode="table2_1"/>
					</xsl:if>
					<xsl:if test="stz_rarc:UsedSTZGoods">
						<tr>
							<td class="graphMain bordered" colspan="7"><br/></td>
						</tr>
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="7">Товары, помещенные под таможенную процедуру свободной таможенной зоны, использованные при изготовлении (получении) товаров</td>
						</tr>
						<xsl:apply-templates select="stz_rarc:UsedSTZGoods" mode="table2_1"/>
					</xsl:if>
					<xsl:if test="stz_rarc:UsedNotSTZGoods">
						<tr>
							<td class="graphMain bordered" colspan="7"><br/></td>
						</tr>
						<tr align="left" valign="top">
							<td class="graphMain bordered" colspan="7">Товары ЕАЭС, не помещенные под таможенную процедуру свободной таможенной зоны, использованные при изготовлении (получении) товаров</td>
						</tr>
						<xsl:apply-templates select="stz_rarc:UsedNotSTZGoods" mode="table2_1"/>
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="table1">
		<table>
			<tbody>
				<tr align="center" valign="top">
					<td class="graphMain bordered" rowspan="3">№ п/п</td>
					<td class="graphMain bordered" rowspan="3">Наименование товара и его описание</td>
					<td class="graphMain bordered" rowspan="3">Код товара</td>
					<td class="graphMain bordered" rowspan="3">Единица измерения</td>
					<td class="graphMain bordered" colspan="3">Товары, помещенные под таможенную процедуру свободной таможенной зоны (количество)</td>
					<td class="graphMain bordered" colspan="19">Использование товаров, помещенных под таможенную процедуру свободной таможенной зоны (количество)</td>
				</tr>
				<tr align="center" valign="top">
					<td class="graphMain bordered" rowspan="2">на начало отчетного периода</td>
					<td class="graphMain bordered" rowspan="2">за отчетный период</td>
					<td class="graphMain bordered" rowspan="2">на конец отчетного периода</td>
					<td class="graphMain bordered" rowspan="2">строительство объектов недвижимости на территории участка резидента<br/>(наименование объекта)</td>
					<td class="graphMain bordered" rowspan="2">оборудование, машины и агрегаты, используемые на территории участка резидента</td>
					<td class="graphMain bordered" rowspan="2">эксплуатация и функционирование участка резидента</td>
					<td class="graphMain bordered" rowspan="2">производство (переработка) товаров</td>
					<td class="graphMain bordered" rowspan="2">отбор проб и образцов</td>
					<td class="graphMain bordered" rowspan="2">Потребление в процессе производства (переработки) товаров</td>
					<td class="graphMain bordered" colspan="2">Уничтожение</td>
					<td class="graphMain bordered" rowspan="2">Получение приплода, выращивание и откорм животных, птиц, аквакультуры, а так же выращивание деревьев и растений</td>
					<td class="graphMain bordered" rowspan="2">Хранение</td>
					<td class="graphMain bordered" rowspan="2">Иное использование</td>
					<td class="graphMain bordered" colspan="4">Вывоз товаров без завершения таможенной процдеруы свободной таможенной зоны с разрешения таможенного органа</td>
					<td class="graphMain bordered" colspan="4">Завершение таможенной процедуры свободной таможенной зоны</td>
				</tr>
				<tr align="center" valign="top">
					<td class="graphMain bordered">в результате аварии</td>
					<td class="graphMain bordered">по разрешению таможенного органа</td>
					<td class="graphMain bordered">ремонт, техобслуживание оборудования</td>
					<td class="graphMain bordered">технические испытания, исследования, демонстрация</td>
					<td class="graphMain bordered">вывоз на участок другого резидента</td>
					<td class="graphMain bordered">вывоз для завершения таможенной процедуры свободной таможенной зоны в иной таможенный орган</td>
					<td class="graphMain bordered">наименование товара / код товара в соответствии с ТН ВЭД ЕАЭС</td>
					<td class="graphMain bordered">код таможенной процедуры</td>
					<td class="graphMain bordered">номер таможенной декларации</td>
					<td class="graphMain bordered">количество / единица измерения</td>
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
					<td class="graphMain bordered">15</td>
					<td class="graphMain bordered">16</td>
					<td class="graphMain bordered">17</td>
					<td class="graphMain bordered">18</td>
					<td class="graphMain bordered">19</td>
					<td class="graphMain bordered">20</td>
					<td class="graphMain bordered">21</td>
					<td class="graphMain bordered">22</td>
					<td class="graphMain bordered">23</td>
					<td class="graphMain bordered">24</td>
					<td class="graphMain bordered">25</td>
					<td class="graphMain bordered">26</td>
				</tr>
				<tr align="left" valign="top">
					<td class="graphMain bordered" colspan="31">Иностранные товары</td>
				</tr>
				<xsl:apply-templates select="stz_rarc:Table1/stz_rarc:SEZGoodsForeign" mode="table1"/>
				<xsl:if test="stz_rarc:Table1/stz_rarc:SEZGoodsGU">
					<tr align="left" valign="top">
						<td class="graphMain bordered" colspan="31">Товары Евразийского экономического союза</td>
					</tr>
					<xsl:apply-templates select="stz_rarc:Table1/stz_rarc:SEZGoodsGU" mode="table1"/>
				</xsl:if>
			</tbody>
		</table>
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
								<xsl:text>о товарах, помещенных под таможенную процедуру свободной таможенной зоны, применяемую на </xsl:text>
								<xsl:text>участках Акртической зоны Российской Федерации, и товарах, изготовленных (полученных) с использованием товаров, помещенных под таможенную процедуру свободной таможенной зоны, применяемую на участках Арктической зоны Российской Федерации</xsl:text>
							</b>
						</font>
					</td>
				</tr>
				<tr>
					<td align="center">
						<br/>
						<br/>
						<xsl:text>за период </xsl:text>
						<xsl:text>c </xsl:text>
						<xsl:apply-templates select="stz_rarc:ReportingPeriod/stz_rarc:StartDate" mode="month_date"/>
						<xsl:text> по </xsl:text>
						<xsl:apply-templates select="stz_rarc:ReportingPeriod/stz_rarc:EndDate" mode="month_date"/>
						<br/>
						<br/>
						<xsl:text>Дата составления отчетности </xsl:text>
						<xsl:apply-templates select="stz_rarc:ReportingPeriod/stz_rarc:StateDate" mode="month_date"/>
						<xsl:text> на _______ л.</xsl:text>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
						<br/>
						<xsl:text>от </xsl:text>
						<xsl:apply-templates select="stz_rarc:Resident"/>
					</td>
				</tr>
				<tr>
					<td style="border-top: 1px solid black; font-size: 8pt;" align="center">
						(наименование юридического лица, ИНН, ОГРН, КПП или фамилия, имя, отчество (при наличии), ИНН индивидуального предпринимателя, являющегося резидентом Арктической зоны Российской Федерации; регистрационный номер в реестре резидентов Арктической зоны Российской Федерации, адрес юридического лица в пределах места нахождения юридического лица или место жительства индивидуального предпринимателя, номер телефона)
					</td>
				</tr>
				<tr>
					<td align="center">
						<br/>
						<br/>
						<xsl:apply-templates select="stz_rarc:ReportPerson"/>
					</td>
				</tr>
				<tr>
					<td style="border-top: 1px solid black; font-size: 8pt;" align="center">
						(Фамилия, имя, отчество (при наличии), подпись руководителя юридического лица или индивидуального предпринимателя либо иного лица, уполномоченного руководителем юридического лица или индивидуальным предпринимателем, дата составления)
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- ТАБЛИЦА 1 -->
	<xsl:template match="stz_rarc:SEZGoodsForeign|stz_rarc:SEZGoodsGU" mode="table1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:Measure" mode="measure"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:WeightStart" mode="weight"/>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:WeightDiff" mode="weight"/>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:WeightEnd" mode="weight"/>
			</td>
			<!-- 8 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:PropertyCreateGoods"/>
			</td>
			<!-- 9 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:EquipmentGoods"/>
			</td>
			<!-- 10 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:ExploitationGoods"/>
			</td>
			<!-- 11 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:RecycledGoods"/>
			</td>
			<!-- 12 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:ResearchGoods">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="stz_rarc:Quantity"/>
					<xsl:if test="stz_rarc:CustomsDoc">
						<br/>
						<xsl:apply-templates select="stz_rarc:CustomsDoc" mode="doc"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<!-- 13 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:ConsumedGoods"/>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:DestroyedGoods[stz_rarc:Reason = 0 or translate(substring(stz_rarc:Reason, 1, 1), 'f', 'F') = 'F']">
					<xsl:if test="position()!=1">
						<xsl:text>/</xsl:text>
					</xsl:if>
					<xsl:apply-templates select="stz_rarc:Quantity" mode="quantityMax"/>
				</xsl:for-each>
			</td>
			<!-- 15 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:DestroyedGoods[stz_rarc:Reason = 1 or translate(substring(stz_rarc:Reason, 1, 1), 't', 'T') = 'T']">
					<xsl:if test="position()!=1">
						<xsl:text>/</xsl:text>
					</xsl:if>
					<xsl:apply-templates select="stz_rarc:Quantity" mode="quantityMax"/>
				</xsl:for-each>
			</td>
			<!-- 16 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:NatureGoods"/>
			</td>
			<!-- 17 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:LeftGoods"/>
			</td>
			<!-- 18 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:OtherConsumedGoods"/>
			</td>
			<!-- 19 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:OtherExportGoods[stz_rarc:ExportPurpose = 1]"/>
			</td>
			<!-- 20 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:OtherExportGoods[stz_rarc:ExportPurpose = 2]"/>
			</td>
			<!-- 21 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:OtherExportGoods[stz_rarc:ExportPurpose = 3]"/>
			</td>
			<!-- 22 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:OtherExportGoods[stz_rarc:ExportPurpose = 4]"/>
			</td>
			<!-- 23 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:DTGoods">
					<xsl:if test="position() != 1"><br/><br/></xsl:if>
					<xsl:apply-templates select="stz_rarc:GoodsItem/stz_rarc:NameGoods"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="stz_rarc:TNVEDCode"/>
				</xsl:for-each>
			</td>
			<!-- 24 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:DTGoods">
					<xsl:if test="position() != 1"><br/><br/></xsl:if>
					<xsl:apply-templates select="stz_rarc:CustomsProcedure"/>
				</xsl:for-each>
			</td>
			<!-- 25 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:DTGoods">
					<xsl:if test="position() != 1"><br/><br/></xsl:if>
					<xsl:apply-templates select="stz_rarc:CustomsDoc/stz_rarc:GTDID" mode="reg_num"/>
				</xsl:for-each>
			</td>
			<!-- 26 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:DTGoods">
					<xsl:if test="position() != 1"><br/><br/></xsl:if>
					<xsl:for-each select="stz_rarc:GoodsQuantity/*">
						<xsl:if test="position() != 1">/</xsl:if>
						<xsl:choose>
							<xsl:when test="local-name() = 'Quantity'"><xsl:apply-templates select="." mode="quantity"/></xsl:when>
							<xsl:otherwise><xsl:apply-templates select="."/></xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- /ТАБЛИЦА 1 -->
	<!-- ТАБЛИЦА 2.1 -->
	<xsl:template match="stz_rarc:ProducedGoodsMix|stz_rarc:UsedSTZGoods|stz_rarc:UsedNotSTZGoods" mode="table2_1">
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:GoodsStatus"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:NormaQuantity/stz_rarc:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				</xsl:for-each>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered">
				<xsl:for-each select="stz_rarc:NormaQuantity/stz_rarc:Quantity">
					<xsl:if test="position() != 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				</xsl:for-each>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered">
				<xsl:apply-templates select="stz_rarc:NormaDoc" mode="doc"/>
			</td>
		</tr>
	</xsl:template>
	<!-- /ТАБЛИЦА 2.1 -->
	<!-- ТАБЛИЦА 2.2 -->
	<xsl:template match="stz_rarc:Table22">
		<xsl:variable name="rowspan">
			<xsl:choose>
				<xsl:when test="count(stz_rarc:Procedure) &gt; 0">
					<xsl:value-of select="count(stz_rarc:Procedure)"/>
				</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr align="center" valign="top">
			<!-- 1 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="stz_rarc:Number"/>
			</td>
			<!-- 2 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="stz_rarc:GoodsItem"/>
			</td>
			<!-- 3 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="stz_rarc:TNVEDCode"/>
			</td>
			<!-- 4 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="stz_rarc:Measure" mode="measure"/>
			</td>
			<!-- 5 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:for-each select="stz_rarc:QuantityBefore/stz_rarc:Quantity">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity"/>
				</xsl:for-each>
			</td>
			<!-- 6 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:for-each select="stz_rarc:QuantityDuring/stz_rarc:Quantity">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity"/>
				</xsl:for-each>
			</td>
			<!-- 7 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:for-each select="stz_rarc:QuantityAfter/stz_rarc:Quantity">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity"/>
				</xsl:for-each>
			</td>
			
			<!-- 8 - 12 -->
			<xsl:call-template name="procedures">
				<xsl:with-param name="procedure" select="stz_rarc:Procedure[1]"/>
			</xsl:call-template>
			
			<!-- 13 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:for-each select="stz_rarc:Quantity/stz_rarc:Quantity">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity"/>
				</xsl:for-each>
			</td>
			<!-- 14 -->
			<td class="graphMain bordered" rowspan="{$rowspan}">
				<xsl:apply-templates select="stz_rarc:Comments"/>
			</td>
		</tr>
		<xsl:for-each select="stz_rarc:Procedure[position() &gt; 1]">
			<tr align="center" valign="top">
				<xsl:call-template name="procedures">
					<xsl:with-param name="procedure" select="."/>
				</xsl:call-template>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="procedures">
		<xsl:param name="procedure"/>
		<!-- 8 -->
		<td class="graphMain bordered">
			<xsl:apply-templates select="$procedure/stz_rarc:CustomsModeCode"/>
		</td>
		<!-- 9 -->
		<td class="graphMain bordered">
			<xsl:apply-templates select="$procedure/stz_rarc:GoodsStatus"/>
		</td>
		<!-- 10 -->
		<td class="graphMain bordered">
			<xsl:apply-templates select="$procedure/stz_rarc:IdentDoc" mode="doc"/>
		</td>
		<!-- 11 -->
		<td class="graphMain bordered">
			<xsl:apply-templates select="$procedure/stz_rarc:DT/stz_rarc:GTDID" mode="reg_num"/>
		</td>
		<!-- 12 -->
		<td class="graphMain bordered">
			<xsl:apply-templates select="$procedure/stz_rarc:Quantity"/>
		</td>
	</xsl:template>
	<!-- /ТАБЛИЦА 2.2 -->
	<xsl:template match="*" mode="weight">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:variable name="ln" select="local-name()"/>
			<xsl:choose>
				<xsl:when test="contains($ln, 'Gross')">брутто: </xsl:when>
				<xsl:when test="contains($ln, 'Net')">нетто: </xsl:when>
				<xsl:when test="contains($ln, 'Pack')">упаковка: </xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="stz_rarc:OtherExportGoods">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="stz_rarc:Quantity" mode="quantityMax"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="stz_rarc:CustomsDoc" mode="doc"/>
	</xsl:template>
	<xsl:template match="stz_rarc:OtherConsumedGoods">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:choose>
			<xsl:when test="stz_rarc:ConsumeType = 1">Эксплуатация объектов недвижимости - </xsl:when>
			<xsl:when test="stz_rarc:ConsumeType = 2">Эксплуатация оборудования - </xsl:when>
			<xsl:when test="stz_rarc:ConsumeType = 3">Исследования (испытания) - </xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="stz_rarc:Quantity" mode="quantityMax"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="stz_rarc:CustomsDoc" mode="doc"/>
	</xsl:template>
	<xsl:template match="stz_rarc:PropertyCreateGoods">
		<xsl:apply-templates select="stz_rarc:Quantity" mode="quantityMax"/>
		<xsl:text> / </xsl:text>
		<xsl:apply-templates select="stz_rarc:PropertyName"/>
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
	<xsl:template match="*" mode="quantityMax">
		<xsl:if test="stz_rarc:ArticleWeight">
			<xsl:apply-templates select="stz_rarc:ArticleWeight"/>
			<xsl:text> кг</xsl:text>
		</xsl:if>
		<xsl:if test="stz_rarc:Quantity and stz_rarc:ArticleWeight">
			<br/>
		</xsl:if>
		<xsl:for-each select="stz_rarc:Quantity">
			<xsl:if test="position() != 1">
				<br/>
			</xsl:if>
			<xsl:apply-templates select="." mode="quantity"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="stz_rarc:NatureGoods|stz_rarc:ExploitationGoods|stz_rarc:EquipmentGoods|stz_rarc:ConsumGoods|stz_rarc:ConsumedGoods|stz_rarc:RecycledGoods|stz_rarc:LeftGoods|stz_rarc:GoodsQuantity|stz_rarc:Quantity|stz_rarc:GoodsLeft">
		<xsl:if test="stz_rarc:ArticleWeight">
			<xsl:apply-templates select="stz_rarc:ArticleWeight"/>
			<xsl:text> кг</xsl:text>
		</xsl:if>
		<xsl:if test="stz_rarc:Quantity and stz_rarc:ArticleWeight">
			<br/>
		</xsl:if>
		<xsl:for-each select="stz_rarc:Quantity">
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
	<xsl:template match="stz_rarc:TUGoods">
		<xsl:apply-templates select="stz_rarc:CustomsDoc" mode="doc"/>
		<xsl:text> / </xsl:text>
		<xsl:apply-templates select="stz_rarc:GoodsNumeric"/>
	</xsl:template>
	<xsl:template match="stz_rarc:DT">
		<xsl:apply-templates select="stz_rarc:GTDID" mode="reg_num"/>
		<xsl:text> / </xsl:text>
		<xsl:apply-templates select="stz_rarc:GoodsNumeric"/>
	</xsl:template>
	<xsl:template match="*" mode="measure">
		<xsl:apply-templates select="stz_rarc:MeasureUnitQualifierName"/>
	</xsl:template>
	<xsl:template match="stz_rarc:GoodsItem">
		<xsl:apply-templates select="stz_rarc:NameGoods"/>
		<xsl:for-each select="*[local-name() != 'NameGoods']">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="stz_rarc:ReportPerson">
		<xsl:for-each select="*[contains(local-name(), 'ame')]">
			<xsl:if test="position() != 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<span style="display: inline-block;width: 50mm;"/>
		<xsl:apply-templates select="*[local-name() = 'IssueDate']" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="stz_rarc:Resident">
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
		<xsl:apply-templates select="stz_rarc:ResidentCertificate"/>
		<xsl:if test="RUScat_ru:CommunicationDetails/cat_ru:Phone">
			<xsl:text>, т.: </xsl:text>
			<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:Phone">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="stz_rarc:ResidentCertificate">
		<xsl:text>, свидетельство: </xsl:text>
		<xsl:text> № </xsl:text>
		<xsl:apply-templates select="stz_rarc:CertificateNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:apply-templates select="stz_rarc:CertificateDate" mode="russian_date"/>
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