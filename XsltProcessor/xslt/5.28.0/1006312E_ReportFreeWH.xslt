<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:rfwh="urn:customs.ru:Information:CustomsDocuments:ReportFreeWH:5.28.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0">
	<!-- Шаблон для типа ReportFreeWHType -->
	<xsl:template match="rfwh:ReportFreeWH">
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
                  /*white-space: normal;*/
                  }

                 div.page {
					/*width: 277mm;*/
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 10mm;
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
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
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
					
					table.tbl td, table.tbl th{
						border: 1px solid black;
						vertical-align: top;
						//text-align: center;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									ФОРМЫ ОТЧЕТНОСТИ<br/>о товарах, помещенных под таможенную процедуру<br/>свободного склада, и товаров, изготовленных (полученных)<br/>с использованием товаров, помещенных под таможенную процедуру<br/>свободного склада
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text> за период с </xsl:text>
										<xsl:apply-templates mode="russian_date_month" select="rfwh:ReportingPeriod/rfwh:StartDate"/>
									<xsl:text> по </xsl:text>
										<xsl:apply-templates mode="russian_date_month" select="rfwh:ReportingPeriod/rfwh:EndDate"/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<!--xsl:if test="rfwh:ReportDate">
										<xsl:text>по состоянию на </xsl:text>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="rfwh:ReportDate"/>
										</xsl:call-template>
									</xsl:if-->
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>Дата составления отчетности </xsl:text>	<xsl:apply-templates mode="russian_date_month" select="rfwh:ReportDate"/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="20%" align="right" valign="top">от</td>
												<td width="60%" class="value" align="center">
													<xsl:for-each select="rfwh:Organization">
														<xsl:value-of select="cat_ru:OrganizationName"/>
														<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
															<xsl:value-of select="cat_ru:ShortName"/>
														</xsl:if>
														<xsl:if test="rfwh:OwnerWHRegNum">
															<xsl:text>, номер в реестре </xsl:text>
															<xsl:apply-templates select="rfwh:OwnerWHRegNum"/>
														</xsl:if>
														<xsl:text>, </xsl:text>
														<xsl:for-each select="cat_ru:RFOrganizationFeatures">
															<xsl:if test="cat_ru:OGRN">
																<xsl:text>ОРГН/ОГРНИП </xsl:text>
																<xsl:value-of select="cat_ru:OGRN"/>
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:if test="cat_ru:INN">
																<xsl:text>ИНН </xsl:text>
																<xsl:value-of select="cat_ru:INN"/>
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:if test="cat_ru:KPP">
																<xsl:text>КПП </xsl:text>
																<xsl:value-of select="cat_ru:KPP"/>
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:text>адрес: </xsl:text>
														<xsl:call-template name="address">
															<xsl:with-param name="address" select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode = 1]"/>
														</xsl:call-template>
														<xsl:text>, </xsl:text>
														<xsl:text>местонахождение: </xsl:text>
														<xsl:call-template name="address">
															<xsl:with-param name="address" select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode = 2]"/>
														</xsl:call-template>
														<xsl:if test="RUScat_ru:CommunicationDetails/cat_ru:Phone">
															<xsl:text>, телефон: </xsl:text>
															<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:Phone">
																<xsl:if test="position()!=1">, </xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td width="20%"/>
											</tr>
											<tr>
												<td/>
												<td align="center">
													(наименование российского юридического лица, являющегося владельцем свободного склада или юридического лица, исключенного из реестра владельцев свободных складов, владеющего (пользующегося) товарами, помещенными под таможенную процедуру свободного склада, и (или) товарами,
   изготовленными (полученными) с использованием товаров, помещенных под таможенную процедуру свободного склада; регистрационный номер в реестре владельцев свободных складов; идентификационный номер налогоплательщика,
  код причины постановки на учет, основной государственный регистрационный номер юридического лица; адрес, местонахождение, номер телефона)
												</td>
												<td/>
											</tr>
										</tbody>
									</table>
									<br/>
									<br/>
									<table>
										<tbody>
											<tr>
												<td width="20%"/>
												<td width="30%" class="value" align="left">
													<xsl:for-each select="rfwh:PersonWHSignature">
														<xsl:apply-templates select="cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
													</xsl:for-each>
												</td>
												<td width="30%" class="value" align="right">
													<xsl:apply-templates select="rfwh:PersonWHSignature/cat_ru:IssueDate" mode="russian_date_month"/>
												</td>
												<td width="20%"/>
											</tr>
											<tr>
												<td/>
												<td colspan="2" align="center">
													(Фамилия, имя, отчество (при наличии), подпись руководителя юридического лица либо иного уполномоченного лица, дата составления) 
												</td>
												<td/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- Форма 1 -->
				<xsl:if test="rfwh:ReportForm = 1">
					<div class="page" style="width: {$w * 3}mm;">
						<table style="width:100%;">
							<tbody>
								<tr>
									<td align="center">
										<b>Форма № 1. Товары, помещенные под таможенную процедуру свободной таможенной зоны</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table class="tbl">
											<tbody>
												<tr align="center">
													<td rowspan="3">N п/п </td>
													<td rowspan="3">Наименование товара </td>
													<td rowspan="3">Код товара по ТН ВЭД ЕАЭС </td>
													<td rowspan="3">Единица измерения </td>
													<td colspan="3">Товары, помещенные под таможенную процедуру свободного склада (количество)</td>
													<td colspan="19">Использование товаров, помещенных под таможенную процедуру свободного склада (количество) </td>
												</tr>
												<tr align="center">
													<td rowspan="2">на начало отчетного периода </td>
													<td rowspan="2">за отчетный период </td>
													<td rowspan="2">на конец отчетного периода </td>
													<td rowspan="2">строительство объектов недвижимости на территории свободного склада (наименование объекта) </td>
													<td rowspan="2">оборудование, машины и агрегаты, используемые на территории свободного склада </td>
													<td rowspan="2">эксплуатация и функционирование свободного склада </td>
													<td rowspan="2">производство (переработка) товаров </td>
													<td rowspan="2">отбор проб и образцов </td>
													<td rowspan="2">Потребление в процессе производства (переработки) товаров </td>
													<td colspan="2">Уничтожение</td>
													<td rowspan="2">Получение приплода, выращивание и откорм животных, птиц, аквакультуры, а также выращивание деревьев и растений </td>
													<td rowspan="2">Хранение </td>
													<td rowspan="2">Иное использование </td>
													<td colspan="4">Вывоз товаров без завершения таможенной процедуры свободного склада с разрешения таможенного органа </td>
													<td colspan="4">Завершение таможенной процедуры свободного склада </td>
												</tr>
												<tr align="center">
													<td>в результате аварии </td>
													<td>по разрешению таможенного органа </td>
													<td>ремонт, техническое обслуживание оборудования </td>
													<td>Технические испытания, исследования, демонстрация </td>
													<td>вывоз на другой свободный склад </td>
													<td>вывоз для завершения таможенной процедуры свободного склада в иной таможенный орган </td>
													<td>наименование товара/код товара по ТН ВЭД ЕАЭС </td>
													<td>код таможенной процедуры </td>
													<td>номер таможенной декларации </td>
													<td>количество/единица измерения </td>
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
													<td>9</td>
													<td>10</td>
													<td>11</td>
													<td>12</td>
													<td>13</td>
													<td>14</td>
													<td>15</td>
													<td>16</td>
													<td>17</td>
													<td>18</td>
													<td>19</td>
													<td>10</td>
													<td>21</td>
													<td>22</td>
													<td>23</td>
													<td>24</td>
													<td>25</td>
													<td>26</td>
												</tr>
												<tr>
													<td colspan="26">Иностранные товары</td>
												</tr>
												<xsl:apply-templates select="rfwh:PlacedGoodsWH[rfwh:Status='ИТ']"/>
												<tr>
													<td colspan="26">Товары Евразийского экономического союза</td>
												</tr>
												<xsl:apply-templates select="rfwh:PlacedGoodsWH[rfwh:Status='ТЕАЭС']"/>
											</tbody>
										</table>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- Форма 2 -->
				<xsl:if test="rfwh:ReportForm = 2">
					<div class="page">
						<table width="100%">
							<tbody>
								<tr>
									<td align="center">
										<b>Форма N 2. Товары, изготовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободного склада, и товаров Евразийского экономического союза, не помещенных под таможенную процедуру свободного склада</b>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="right">
										Таблица № 1
									</td>
								</tr>
								<tr>
									<td>
										Товары, изготовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободного склада
									</td>
								</tr>
								<tr>
									<td>
										<table class="tbl">
											<tbody>
												<tr>
													<th rowspan="2">№ п/п</th>
													<th rowspan="2">Наименование товара</th>
													<th rowspan="2">Код товара по ТН ВЭД ЕАЭС</th>
													<th rowspan="2">Статус товара</th>
													<th colspan="3">Нормы выхода/нормы расхода </th>
												</tr>
												<tr>
													<th>Количество</th>
													<th>Единица измерения</th>
													<th>Номер документа</th>
												</tr>
												<tr>
													<th>1</th>
													<th>2</th>
													<th>3</th>
													<th>4</th>
													<th>5</th>
													<th>6</th>
													<th>7</th>
												</tr>
												<xsl:for-each select="rfwh:ManufacturedGoods/rfwh:ManufacturedGoodsDetails">
													<tr>
														<td colspan="7"><xsl:value-of select="position()"/>Товары, изготовленные (полученные) с использованием товаров, помещенных под таможенную процедуру свободного склада</td>
													</tr>
													<xsl:apply-templates select="." mode="Form2Table1"/>
													<tr>
														<td colspan="7">Товары, помещенные под таможенную процедуру свободного склада, использованные при изготовлении (получении) товаров</td>
													</tr>
													<xsl:apply-templates select="rfwh:GoodsWH" mode="Form2Table1"/>
													<tr>
														<td colspan="7">Товары ЕАЭС, не помещенные под таможенную процедуру свободного склада, использованные при изготовлении (получении) товаров </td>
													</tr>
													<xsl:apply-templates select="rfwh:GoodsEEU" mode="Form2Table1"/>
												</xsl:for-each>
											</tbody>
										</table>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="right">
										Таблица № 2
									</td>
								</tr>
								<tr>
									<td>
										Использование товаров, изготовленных (полученных) на территории свободного склада с использованием товаров, помещенных под таможенную процедуру свободного склада
									</td>
								</tr>
								<tr>
									<td>
										<table class="tbl">
											<tbody>
												<tr align="center">
													<td rowspan="3">№ п/п</td>
													<td rowspan="3">Наименование товара</td>
													<td rowspan="3">Код товара по ТН ВЭД ЕАЭС</td>
													<td rowspan="3">Единица измерения</td>
													<td colspan="3">Количество</td>
													<td colspan="7">Использование товаров</td>
												</tr>
												<tr align="center">
													<td rowspan="2">начало отчетного периода</td>
													<td rowspan="2">за отчетный период</td>
													<td rowspan="2">на конец отчетного периода</td>
													<td colspan="5">помещение под таможенную процедуру</td>
													<td colspan="2">иное</td>
												</tr>
												<tr align="center">
													<td>код таможенной процедуры</td>
													<td>статус товара</td>
													<td>номер и дата заключения (при наличии)</td>
													<td>номер таможенной декларации</td>
													<td>количество / единица измерения</td>
													<td>количество / единица измерения</td>
													<td>примечание</td>
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
													<td>9</td>
													<td>10</td>
													<td>11</td>
													<td>12</td>
													<td>13</td>
													<td>14</td>
												</tr>
												<xsl:apply-templates select="rfwh:ManufacturedGoods/rfwh:UsedGoods" mode="Form2Table2"/>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="Form2Table2">
		<tr>
			<td>
				<xsl:apply-templates select="rfwh:Position"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:GoodsDescription"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:GoodsTNVEDCode"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:MeasureUnitQualifierName"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:GoodsQuantityStart"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:GoodsQuantityReportPeriod"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:GoodsQuantityEnd"/>
			</td>
			<td>
				<xsl:for-each select="rfwh:UsedGoodsInfo/rfwh:CustomsProcedure">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="rfwh:CustomsProcedureCode"/>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="rfwh:UsedGoodsInfo/rfwh:CustomsProcedure">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="rfwh:Status"/>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="rfwh:UsedGoodsInfo/rfwh:CustomsProcedure">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="rfwh:CustomsConclusion" mode="docSlash"/>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="rfwh:UsedGoodsInfo/rfwh:CustomsProcedure">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="rfwh:DeclInfo[1]" mode="reg_num"/>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="rfwh:UsedGoodsInfo/rfwh:CustomsProcedure">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="rfwh:DeclInfo[1]/rfwh:GoodsQuantity" mode="quantity"/>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="rfwh:UsedGoodsInfo/rfwh:OtherUse/rfwh:GoodsQuantity[1]">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="." mode="quantity"/>
				</xsl:for-each>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:UsedGoodsInfo/rfwh:OtherUse/rfwh:Comment"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="Form2Table1">
		<tr>
			<td>
				<xsl:apply-templates select="rfwh:Position"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:GoodsDescription"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:GoodsTNVEDCode"/>
			</td>
			<td>
				<xsl:apply-templates select="rfwh:Status"/>
			</td>
			<td>
				<xsl:for-each select="rfwh:OutputRates/rfwh:GoodsQuantity">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="rfwh:OutputRates/rfwh:GoodsQuantity">
					<xsl:if test="position()!=1"><br/></xsl:if>
					<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
					<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
						<xsl:text> (</xsl:text>
						<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="rfwh:OutputRates/rfwh:CalculateDoc">
					<xsl:if test="position()!=1">;<br/></xsl:if>
					<xsl:apply-templates select="." mode="docSlash"/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="*" mode="docSlash">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">/</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="rfwh:PlacedGoodsWH">
		<xsl:variable name="rowspan">
			<xsl:choose>
				<xsl:when test="rfwh:EndProcedureWH">
					<xsl:value-of select="count(rfwh:EndProcedureWH)"/>
				</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr>
			<!--1-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:Position"/>
			</td>
			<!--2-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:GoodsDescription"/>
			</td>
			<!--3-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:GoodsTNVEDCode"/>
			</td>
			<!--4-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:MeasureUnitQualifierName"/>
			</td>
			<!--5-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:GoodsQuantityStart"/>
			</td>
			<!--6-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:GoodsQuantityReportPeriod"/>
			</td>
			<!--7-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:GoodsQuantityEnd"/>
			</td>
			<!--8-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:ConstructionPropertyGoods/rfwh:PropertyName"/>
			</td>
			<!--9-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:EquipmentGoods"/>
			</td>
			<!--10-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:SupportProductionGoods"/>
			</td>
			<!--11-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:ProcessingGoods"/>
			</td>
			<!--12-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:SamplesGoods"/>
			</td>
			<!--13-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:NotPartGoods"/>
			</td>
			<!--14-->
			<td rowspan="{$rowspan}">
				<xsl:for-each select="rfwh:ProductUseInfo/rfwh:DestroyedGoods/rfwh:LostedGoods">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<!--15-->
			<td rowspan="{$rowspan}">
				<xsl:for-each select="rfwh:ProductUseInfo/rfwh:DestroyedGoods/rfwh:RuinedGoods">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="."/>
					<br/>
					<xsl:apply-templates select="../rfwh:CustomsPermit" mode="doc"/>
				</xsl:for-each>
			</td>
			<!--16-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:RaisingGoods"/>
			</td>
			<!--17-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:UnchangedGoods"/>
			</td>
			<!--18-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:OtherUseGoods"/>
			</td>
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:RepairGoods" mode="quantityDoc"/>
			</td>
			<!--19-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:TestGoods" mode="quantityDoc"/>
			</td>
			<!--20-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:FreeWHGoods" mode="quantityDoc"/>
			</td>
			<!--21-->
			<td rowspan="{$rowspan}">
				<xsl:apply-templates select="rfwh:ProductUseInfo/rfwh:CloseProcedureGoods" mode="quantityDoc"/>
			</td>
			<!--22-->
			<td>
				<xsl:apply-templates select="rfwh:EndProcedureWH[1]/rfwh:GoodsDescription"/>
				<xsl:if test="rfwh:EndProcedureWH[1]/rfwh:GoodsDescription and rfwh:EndProcedureWH[1]/rfwh:GoodsTNVEDCode"><xsl:text> / </xsl:text></xsl:if>
				<xsl:apply-templates select="rfwh:EndProcedureWH[1]/rfwh:GoodsTNVEDCode"/>
			</td>
			<!--23-->
			<td><xsl:apply-templates select="rfwh:EndProcedureWH[1]/rfwh:CustomsProcedureCode"/></td>
			<!--24-->
			<td><xsl:apply-templates select="rfwh:EndProcedureWH[1]/rfwh:DeclInfo" mode="reg_num"/></td>
			<!--25-->
			<td><xsl:apply-templates select="rfwh:EndProcedureWH[1]/rfwh:DeclInfo"/></td>
		</tr>
		<xsl:for-each select="rfwh:EndProcedureWH[position() &gt; 1]">
			<tr>
				<td>
					<xsl:apply-templates select="rfwh:GoodsDescription"/>
					<xsl:if test="rfwh:GoodsDescription and rfwh:GoodsTNVEDCode"><xsl:text> / </xsl:text></xsl:if>
					<xsl:apply-templates select="rfwh:GoodsTNVEDCode"/>
				</td>
				<td><xsl:apply-templates select="rfwh:CustomsProcedureCode"/></td>
				<td><xsl:apply-templates select="rfwh:DeclInfo" mode="reg_num"/></td>
				<td><xsl:apply-templates select="rfwh:DeclInfo"/></td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="rfwh:DeclInfo">
		<xsl:if test="position()!=1"><br/></xsl:if>
		<xsl:for-each select="rfwh:GoodsQuantity">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:apply-templates select="." mode="quantity"/>
		</xsl:for-each>
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
	
	<xsl:template match="*" mode="reg_num">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	
	<xsl:template match="*" mode="quantityDoc">
		<xsl:apply-templates select="rfwh:GoodsDescription"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="rfwh:GoodsTNVEDCode"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="rfwh:Quantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="rfwh:CustomsPermit" mode="doc"/>
	</xsl:template>
	
	<xsl:template match="rfwh:OtherUseGoods">
		<xsl:apply-templates select="rfwh:Quantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="rfwh:WayUse"/>
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
	
	<xsl:template name="address">
		<xsl:param name="address"/>
		<xsl:for-each select="$address/*[local-name() != 'AddressKindCode']">
			<xsl:if test="local-name()!='CountryCode'">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
		
	<xsl:template name="month_name">
		<xsl:param name="monthIn"/>
		<xsl:choose>
			<xsl:when test="$monthIn='01'">января</xsl:when>
			<xsl:when test="$monthIn='02'">февраля</xsl:when>
			<xsl:when test="$monthIn='03'">марта</xsl:when>
			<xsl:when test="$monthIn='04'">апреля</xsl:when>
			<xsl:when test="$monthIn='05'">мая</xsl:when>
			<xsl:when test="$monthIn='06'">июня</xsl:when>
			<xsl:when test="$monthIn='07'">июля</xsl:when>
			<xsl:when test="$monthIn='08'">августа</xsl:when>
			<xsl:when test="$monthIn='09'">сентября</xsl:when>
			<xsl:when test="$monthIn='10'">октября</xsl:when>
			<xsl:when test="$monthIn='11'">ноября</xsl:when>
			<xsl:when test="$monthIn='12'">декабря</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month_name">
					<xsl:with-param name="monthIn" select="substring($dateIn,6,2)"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
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
	<xsl:template match="//*[local-name()='ReportFreeWH']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_month">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_month">
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
