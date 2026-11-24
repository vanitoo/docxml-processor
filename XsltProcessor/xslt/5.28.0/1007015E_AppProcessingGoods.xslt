<?xml version="1.0" encoding="utf-8"?>
<!--apg:ProcessingProcedureCode = 21 - переработка вне ТТ
Приказ Минфина России от 14.01.2020 №7н Приложение №2

apg:ProcessingProcedureCode = 51 - переработка на ТТ
Приказ Минфина России от 24.12.2019 №246н Приложение №2

apg:ProcessingProcedureCode = 91 - переработка для внутреннего потребления
Приказ Минфина России от 14.01.2020 №5н Приложение №2-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:apg="urn:customs.ru:Information:ProcessingDocuments:AppProcessingGoods:5.28.0">
	<xsl:variable name="indent" select="0"/>
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
	<xsl:template match="//*[local-name()='AppProcessingGoods']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
	<xsl:template match="*" mode="format_translate">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.',',')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="format_number_2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(translate(format-number(., '#,###.00'),',',' '),'.',',')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<!-- Шаблон для типа AppProcessingGoodsType -->
	<xsl:template match="apg:AppProcessingGoods">
		<xsl:param name="w" select="180"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
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

                  table.int
                  {
                  width: 96%;
                  margin-left: 5px;
                  margin-right: 5px;
                  table-layout: fixed;
                  }

                  table.ext_border
                  {
                  width: 100%;
                  border: 1px solid windowtext;
                  border-collapse: separate;
                  table-layout: fixed;
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
                  vertical-align:bottom;
                  }

                  .annot
                  {
                  /*font-weight:bold;*/
                  font-family: Arial;
                  font-size: 10pt;
                  }

                  td.annot
                  {
                  vertical-align:bottom;
                  padding-top: 5px;
                  }

                  .annot_t
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  vertical-align:top;
                  }

                  .underline
                  {
                  font-family: Arial;
                  font-size: 7pt;
                  vertical-align:top;
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

                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<xsl:variable name="cnt_ProcOrganization" select="count(apg:ProcessingDescription/apg:ProcOrganization)"/>
					<br/>
					<xsl:choose>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* переработка ВНЕ ТТ *********************************************************************************************************************************************************** -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="apg:ProcessingProcedureCode='21'">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>Заявление на переработку товаров</xsl:text>
													<br/>
													<xsl:text>вне таможенной территории</xsl:text>
												</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="38%" class="annot_t">
											<p style="text-indent: {$indent}%;">
												<xsl:text>1. Начальнику таможни:</xsl:text>
											</p>
										</td>
										<td width="62%" class="value">
											<xsl:for-each select="apg:Customs">
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="cat_ru:Code"/>
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>) </xsl:text>
													<xsl:apply-templates select="cat_ru:OfficeName"/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="annot"/>
										<td class="underline" align="center">
											<xsl:text>(наименование таможни)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:call-template name="Applicant_one_str_info">
								<xsl:with-param name="node" select="apg:Applicant"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%; text-align:justify;">
											<xsl:text>3. Прошу выдать разрешение на переработку товаров вне таможенной территории для совершения операций по переработке товаров Евразийского экономического союза:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:ProcessingGoods"/>
								<xsl:with-param name="title_col4" select="'Количество'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%; text-align:justify;">
											<xsl:text>4. Лицо (лица), осуществляющее(ие) операции по переработке товаров Евразийского экономического союза:</xsl:text>
										</p>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="apg:ProcessingDescription/apg:ProcOrganization">
										<xsl:for-each select="apg:ProcessingDescription/apg:ProcOrganization">
											<xsl:variable name="pos">
												<xsl:choose>
													<xsl:when test="$cnt_ProcOrganization &gt; 1">
														<xsl:value-of select="position()"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="0"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
											<xsl:apply-templates select="." mode="tbl_NOT_underline">
												<xsl:with-param name="num_pp" select="'4'"/>
												<xsl:with-param name="position" select="$pos"/>
											</xsl:apply-templates>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="value" align="center">
												<xsl:text>См. п. 2</xsl:text>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>5. Нормы выхода продуктов переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:YieldNorm">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>6. Продукты переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:PrResult"/>
								<xsl:with-param name="title_col4" select="'Количество'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>7. Замена продуктов переработки эквивалентными иностранными товарами:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="Substitute">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:Substitute/catProc_ru:SubstituteGoods/catProc_ru:ReplacementGoogsOut"/>
								<xsl:with-param name="title_col4" select="'Количество'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>7.1 Ввоз эквивалентных иностранных товаров до вывоза товаров Евразийского экономического союза:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="apg:ProcessingDescription/apg:Substitute/catProc_ru:MovingGoods"/>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>7.2 Сведения, подтверждающие эквивалентность иностранных товаров продуктам переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="apg:ProcessingDescription/apg:Substitute/catProc_ru:EquivalenceDetails"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>8. Срок переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="DateLimit"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>9. Краткое описание технологического процесса совершения операций по переработке, способы и сроки их совершения:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:ProcessingOperations">
											<xsl:if test="position() &gt; 1">;<br/>
											</xsl:if>
											<xsl:apply-templates select="catProc_ru:OperationName"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationMethod"/>
											<xsl:text>. Срок совершения операции: </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationTerm"/>
										</xsl:for-each>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>10. Способ (способы) идентификации товаров  Евразийского экономического союза в продуктах их переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="IdentificationMethod"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>11. Приложение:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="apg:Attachment"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<xsl:apply-templates select="apg:PersonSignature">
											<xsl:with-param name="fio_descr" select="'фамилия, имя, отчество (при наличии) руководителя заявителя (декларанта)'"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr>
									<td class="underline">
										<br/>
									</td>
								</tr>
							</table>
						</xsl:when>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* переработка НА ТТ ************************************************************************************************************************************************************ -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="apg:ProcessingProcedureCode='51'">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>Заявление на переработку товаров</xsl:text>
													<br/>
													<xsl:text>на таможенной территории</xsl:text>
												</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="38%" class="annot_t">
											<p style="text-indent: {$indent}%;">
												<xsl:text>1. Начальнику таможни:</xsl:text>
											</p>
										</td>
										<td width="62%" class="value">
											<xsl:for-each select="apg:Customs">
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="cat_ru:Code"/>
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>) </xsl:text>
													<xsl:apply-templates select="cat_ru:OfficeName"/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="annot"/>
										<td class="underline" align="center">
											<xsl:text>(наименование таможни)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<xsl:call-template name="Applicant_several_str_info">
								<xsl:with-param name="node" select="apg:Applicant"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align: justify;">
											<xsl:text>3. Прошу выдать разрешение на переработку товаров на таможенной территории для совершения операций по переработке иностранных товаров:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:ProcessingGoods"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%; text-align:justify;">
											<xsl:text>4. Лицо (лица), непосредственно осуществляющее(ие) операции по переработке товаров:</xsl:text>
										</p>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="apg:ProcessingDescription/apg:ProcOrganization">
										<tr>
											<td>
												<xsl:for-each select="apg:ProcessingDescription/apg:ProcOrganization">
													<xsl:variable name="pos">
														<xsl:choose>
															<xsl:when test="$cnt_ProcOrganization &gt; 1">
																<xsl:value-of select="position()"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="0"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:variable>
													<xsl:apply-templates select="." mode="tbl_whith_underline">
														<xsl:with-param name="num_pp" select="'4'"/>
														<xsl:with-param name="position" select="$pos"/>
													</xsl:apply-templates>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="value" align="center">
												<xsl:text>См. п. 2</xsl:text>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>5. Нормы выхода продуктов переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:YieldNorm">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>6. Продукты переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:PrResult"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>7. Отходы:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:WasteProducts/catProc_ru:WasteProductsItem"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>7.1. Сведения о возможности дальнейшего коммерческого использования отходов переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:WasteProducts">
											<xsl:choose>
												<xsl:when test="catProc_ru:IndicatorFurtherUse='1' or catProc_ru:IndicatorFurtherUse='true' or catProc_ru:IndicatorFurtherUse='TRUE' or catProc_ru:IndicatorFurtherUse='t'">
													<xsl:text>Дальнейшее коммерческое использование отходов возможно.</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Дальнейшее коммерческое использование отходов невозможно.</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="catProc_ru:WasteOutProcedure">
												<br/>
												<xsl:text>Код таможенной процедуры для выпуска отходов: </xsl:text>
												<xsl:apply-templates select="catProc_ru:WasteOutProcedure"/>
											</xsl:if>
											<xsl:if test="catProc_ru:WasteOutDisposalInfo">
												<br/>
												<xsl:apply-templates select="catProc_ru:WasteOutDisposalInfo"/>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>8. Остатки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:Heels"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>9. Производственные потери иностранных товаров:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType2">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:Loss"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align: justify;">
											<xsl:text>10. Замена иностранных товаров эквивалентными товарами ЕАЭС:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="Substitute">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:Substitute/catProc_ru:SubstituteGoods/catProc_ru:ReplacementGoogsIn"/>
								<xsl:with-param name="need_col_5" select="'0'"/>
							</xsl:call-template>
							<br/>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>10.1 Вывоз продуктов переработки до ввоза иностранных товаров:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="apg:ProcessingDescription/apg:Substitute/catProc_ru:MovingGoods"/>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>10.2 Сведения, подтверждающие эквивалентность товаров:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="apg:ProcessingDescription/apg:Substitute/catProc_ru:EquivalenceDetails"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>11. Срок переработки товаров:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="DateLimit"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>12. Документы, подтверждающие право владения, пользования и (или) распоряжения иностранными товарами:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:ProcessingDocuments">
											<xsl:apply-templates select="." mode="doc"/>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="underline" align="center">
										<xsl:text>(реквизиты договора (договоров), в соответствии с которым (которыми) товары помещаются под таможенную процедуру </xsl:text>
										<xsl:text>переработки на таможенной территории)</xsl:text>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>13. Краткое описание технологического процесса совершения операций по переработке, сведения о способах и сроках их совершения:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:ProcessingOperations">
											<xsl:if test="position() &gt; 1">;<br/>
											</xsl:if>
											<xsl:apply-templates select="catProc_ru:OperationName"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationMethod"/>
											<xsl:text>. Срок совершения операции: </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationTerm"/>
										</xsl:for-each>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>14. Товары ЕАЭС, используемые при совершении операций по переработке:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType2">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:GoodsProcessImplementation"/>
								<xsl:with-param name="title_col4" select="'Количество в единицах измерения по ТН ВЭД ЕАЭС'"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>15. Способ (способы) идентификации иностранных товаров в продуктах их переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="IdentificationMethod"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>Приложение:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="apg:Attachment"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<xsl:apply-templates select="apg:PersonSignature">
											<xsl:with-param name="fio_descr" select="'фамилия, имя, отчество (при наличии) заявителя'"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr>
									<td class="underline">
										<br/>
									</td>
								</tr>
							</table>
						</xsl:when>
						<!-- ************************************************************************************************************************************************************************************************** -->
						<!-- ************* переработка для ВНУТРЕННЕГО использования ************************************************************************************************************************* -->
						<!-- ************************************************************************************************************************************************************************************************** -->
						<xsl:when test="apg:ProcessingProcedureCode='91'">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>Заявление на переработку товаров</xsl:text>
													<br/>
													<xsl:text>для внутреннего потребления</xsl:text>
												</b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td width="38%" class="annot_t">
											<p style="text-indent: {$indent}%;">
												<xsl:text>1. Начальнику таможни:</xsl:text>
											</p>
										</td>
										<td width="62%" class="value">
											<xsl:for-each select="apg:Customs">
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="cat_ru:Code"/>
												<xsl:if test="cat_ru:OfficeName">
													<xsl:text>) </xsl:text>
													<xsl:apply-templates select="cat_ru:OfficeName"/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="annot"/>
										<td class="underline" align="center">
											<xsl:text>(наименование таможни)</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<xsl:call-template name="Applicant_several_str_info">
								<xsl:with-param name="node" select="apg:Applicant"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align: justify;">
											<xsl:text>3. Прошу выдать разрешение на переработку товаров для внутреннего потребления для совершения операций по переработке следующих иностранных товаров:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:ProcessingGoods"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%; text-align:justify;">
											<xsl:text>4. Лицо (лица), непосредственно осуществляющее(ие) операции по переработке товаров:</xsl:text>
										</p>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="apg:ProcessingDescription/apg:ProcOrganization">
										<xsl:for-each select="apg:ProcessingDescription/apg:ProcOrganization">
											<xsl:variable name="pos">
												<xsl:choose>
													<xsl:when test="$cnt_ProcOrganization &gt; 1">
														<xsl:value-of select="position()"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="0"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:variable>
											<xsl:apply-templates select="." mode="tbl_whith_underline">
												<xsl:with-param name="num_pp" select="'4'"/>
												<xsl:with-param name="position" select="$pos"/>
											</xsl:apply-templates>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="value" align="center">
												<xsl:text>См. п. 2</xsl:text>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>5. Нормы выхода продуктов переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:YieldNorm">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>6. Продукты переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:PrResult"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>7. Отходы переработки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:WasteProducts/catProc_ru:WasteProductsItem"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>7.1. Сведения о возможности дальнейшего коммерческого использования отходов переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:WasteProducts">
											<xsl:choose>
												<xsl:when test="catProc_ru:IndicatorFurtherUse='1' or catProc_ru:IndicatorFurtherUse='true' or catProc_ru:IndicatorFurtherUse='TRUE' or catProc_ru:IndicatorFurtherUse='t'">
													<xsl:text>Дальнейшее коммерческое использование отходов возможно.</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Дальнейшее коммерческое использование отходов невозможно.</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="catProc_ru:WasteOutProcedure">
												<br/>
												<xsl:text>Код таможенной процедуры для выпуска отходов: </xsl:text>
												<xsl:apply-templates select="catProc_ru:WasteOutProcedure"/>
											</xsl:if>
											<xsl:if test="catProc_ru:WasteOutDisposalInfo">
												<br/>
												<xsl:apply-templates select="catProc_ru:WasteOutDisposalInfo"/>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>8. Остатки:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType1">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:Heels"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>9. Производственные потери иностранных товаров:</xsl:text>
										</p>
									</td>
								</tr>
							</table>
							<xsl:call-template name="GoodsTblType2">
								<xsl:with-param name="node" select="apg:ProcessingDescription/apg:Loss"/>
							</xsl:call-template>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>10. Срок переработки товаров:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="DateLimit"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>11. Документы, подтверждающие право владения, пользования и (или) распоряжения иностранными товарами:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:ProcessingDocuments">
											<xsl:apply-templates select="." mode="doc"/>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="underline" align="center">
										<xsl:text>(реквизиты договора (договоров), в соответствии с которым (которыми) товары помещаются под таможенную процедуру </xsl:text>
										<xsl:text>переработки для внутреннего потребления)</xsl:text>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>12. Краткое описание технологического процесса совершения операций по переработке, способов и сроков их совершения:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="apg:ProcessingDescription/apg:ProcessingOperations">
											<xsl:if test="position() &gt; 1">;<br/>
											</xsl:if>
											<xsl:apply-templates select="catProc_ru:OperationName"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationMethod"/>
											<xsl:text>. Срок совершения операции: </xsl:text>
											<xsl:apply-templates select="catProc_ru:OperationTerm"/>
										</xsl:for-each>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;text-align:justify;">
											<xsl:text>13. Способ (способы) идентификации иностранных товаров в продуктах их переработки:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:call-template name="IdentificationMethod"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot_t">
										<p style="text-indent: {$indent}%;">
											<xsl:text>Приложение:</xsl:text>
										</p>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates select="apg:Attachment"/>
									</td>
								</tr>
							</table>
							<br/>
							<table>
								<tr>
									<td class="annot">
										<xsl:apply-templates select="apg:PersonSignature">
											<xsl:with-param name="fio_descr" select="'фамилия, имя, отчество (при наличии) руководителя заявителя (декларанта)'"/>
										</xsl:apply-templates>
									</td>
								</tr>
								<tr>
									<td class="underline">
										<br/>
									</td>
								</tr>
							</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="CustomsMark">
		<xsl:for-each select="apg:CustomsMark">
			<xsl:if test="apg:CancelDate">
				<xsl:text>Дата отзыва (аннулирования) разрешения на переработку: </xsl:text>
				<xsl:apply-templates select="apg:CancelDate" mode="russian_date"/>
				<br/>
			</xsl:if>
			<xsl:if test="apg:RecoveryDate">
				<xsl:text>Дата восстановления разрешения на переработку: </xsl:text>
				<xsl:apply-templates select="apg:RecoveryDate" mode="russian_date"/>
				<br/>
			</xsl:if>
			<xsl:if test="apg:ReasonDocuments">
				<xsl:text>Реквизиты </xsl:text>
				<xsl:choose>
					<xsl:when test="count(apg:ReasonDocuments)=1">
						<xsl:text>документа</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>документов</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>, на основании </xsl:text>
				<xsl:choose>
					<xsl:when test="count(apg:ReasonDocuments)=1">
						<xsl:text>которого </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>которых </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>производится </xsl:text>
				<xsl:if test="apg:CancelDate">
					<xsl:text>отзыв / аннулирование </xsl:text>
				</xsl:if>
				<xsl:if test="apg:CancelDate">
					<xsl:text>восстановление </xsl:text>
				</xsl:if>
				<xsl:text>Разрешения на переработку: </xsl:text>
				<xsl:for-each select="apg:ReasonDocuments">
					<xsl:apply-templates mode="doc" select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>; </xsl:text>
					</xsl:if>
				</xsl:for-each>
				<br/>
			</xsl:if>
			<xsl:if test="apg:LawDocuments">
				<xsl:choose>
					<xsl:when test="count(apg:LawDocuments)=1">
						<xsl:text>Ссылка на правовой акт: </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Ссылки на правовые акты: </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="apg:LawDocuments">
					<xsl:apply-templates mode="doc" select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>; </xsl:text>
					</xsl:if>
				</xsl:for-each>
				<br/>
			</xsl:if>
			<xsl:if test="apg:AddInformation">
				<xsl:apply-templates select="apg:AddInformation"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="*" mode="doc">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:apply-templates select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="apg:ArticleNumber">
			<xsl:text>, статья </xsl:text>
			<xsl:apply-templates select="apg:ArticleNumber"/>
		</xsl:if>
		<xsl:if test="apg:PartNumber">
			<xsl:text>, часть </xsl:text>
			<xsl:apply-templates select="apg:PartNumber"/>
		</xsl:if>
		<xsl:if test="apg:ClauseNumber">
			<xsl:text>, пункт </xsl:text>
			<xsl:apply-templates select="apg:ClauseNumber"/>
		</xsl:if>
	</xsl:template>
	<!--Способ (способы) идентификации иностранных товаров (товаров ЕАЭС) в продуктах переработки-->
	<xsl:template name="IdentificationMethod">
		<xsl:for-each select="apg:ProcessingDescription/apg:IdentificationMethod">
			<xsl:apply-templates select="catProc_ru:IdentificationMethodDescription"/>
			<xsl:if test="catProc_ru:AccountingSystem">
				<br/>
				<xsl:text>Системы учета: </xsl:text>
				<xsl:apply-templates select="catProc_ru:AccountingSystem"/>
			</xsl:if>
			<xsl:if test="catProc_ru:HeelsItem">
				<br/>
				<xsl:text>Документы: </xsl:text>
				<xsl:for-each select="catProc_ru:HeelsItem">
					<xsl:if test="position() &gt; 1">
						<xsl:text>; </xsl:text>
					</xsl:if>
					<xsl:apply-templates mode="doc" select="."/>
				</xsl:for-each>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--Срок переработки -->
	<xsl:template name="DateLimit">
		<xsl:for-each select="apg:ProcessingDescription/apg:TermLimit">
			<xsl:text>Общий срок (мес): </xsl:text>
			<xsl:apply-templates select="apg:TermGeneral"/>
			<xsl:if test="apg:TermCalculation">
				<br/>
				<xsl:text>Расчет срока переработки: </xsl:text>
				<xsl:apply-templates select="apg:TermCalculation"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--Таблица с товарами (тип 1 (catProc_ru:ProcessingGoodsType))-->
	<xsl:template name="GoodsTblType1">
		<xsl:param name="node"/>
		<xsl:param name="title_col4" select="'Количество'"/>
		<xsl:param name="title_col6" select="'Таможенный орган'"/>
		<xsl:param name="need_col_sum" select="'1'"/>
		<xsl:param name="need_OrgName" select="'0'"/>
		<xsl:param name="OrgName" select="''"/>
		<table class="border">
			<tr class="title">
				<td align="center" width="5%">№</td>
				<td align="center" width="35%">Наименование</td>
				<td align="center" width="15%">Код по ТН ВЭД ЕАЭС</td>
				<td align="center" width="15%">
					<xsl:value-of select="$title_col4"/>
				</td>
				<xsl:if test="$need_col_sum='1'">
					<td align="center" width="15%">Стоимость, руб.</td>
				</xsl:if>
				<xsl:if test="$need_OrgName != '1'">
					<td align="center" width="15%">
						<xsl:value-of select="$title_col6"/>
					</td>
				</xsl:if>
				<xsl:if test="$need_OrgName = '1'">
					<td align="center" width="15%">Наименование организации - переработчика</td>
				</xsl:if>
			</tr>
			<tr class="title">
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
				<td align="center">4</td>
				<td align="center">5</td>
				<xsl:if test="$need_col_sum='1'">
					<td align="center">6</td>
				</xsl:if>
			</tr>
			<xsl:for-each select="$node">
				<tr class="annot_t">
					<td align="center">
						<xsl:apply-templates select="catProc_ru:GoodsNamber"/>
					</td>
					<td>
						<xsl:apply-templates select="catProc_ru:GoodsDescription"/>
					</td>
					<td>
						<xsl:apply-templates select="catProc_ru:GoodsTNVEDCode"/>
					</td>
					<td>
						<xsl:if test="catProc_ru:GoodsQuantity">
							<xsl:apply-templates select="catProc_ru:GoodsQuantity" mode="format_translate"/>
						</xsl:if>
						<xsl:if test="catProc_ru:MeasureUnitQualifierName or catProc_ru:MeasureUnitQualifierCode">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catProc_ru:MeasureUnitQualifierName"/>
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:apply-templates select="catProc_ru:MeasureUnitQualifierCode"/>
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
					<xsl:if test="$need_col_sum='1'">
						<td>
							<xsl:if test="catProc_ru:GoodsRubCost">
								<xsl:apply-templates select="catProc_ru:GoodsRubCost" mode="format_number_2"/>
							</xsl:if>
						</td>
					</xsl:if>
					<xsl:if test="$need_OrgName != '1'">
						<td>
							<xsl:for-each select="catProc_ru:CustomsCode">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</xsl:if>
					<xsl:if test="$need_OrgName = '1'">
						<td>
							<xsl:value-of select="$OrgName"/>
						</td>
					</xsl:if>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--Таблица с товарами (тип 2 (catProc_ru:ProcessingBaseGoodsType))-->
	<xsl:template name="GoodsTblType2">
		<xsl:param name="node"/>
		<xsl:param name="title_col4" select="'Количество'"/>
		<table class="border" width="85%">
			<tr class="title">
				<td align="center" width="5%">№</td>
				<td align="center" width="35%">Наименование</td>
				<td align="center" width="15%">Код по ТН ВЭД ЕАЭС</td>
				<td align="center" width="30%">
					<xsl:value-of select="$title_col4"/>
				</td>
			</tr>
			<tr class="title">
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
				<td align="center">4</td>
			</tr>
			<xsl:for-each select="$node">
				<tr class="annot_t">
					<td align="center">
						<xsl:apply-templates select="catProc_ru:GoodsNamber"/>
					</td>
					<td>
						<xsl:apply-templates select="catProc_ru:GoodsDescription"/>
					</td>
					<td>
						<xsl:apply-templates select="catProc_ru:GoodsTNVEDCode"/>
					</td>
					<td>
						<xsl:if test="catProc_ru:GoodsQuantity">
							<xsl:apply-templates select="catProc_ru:GoodsQuantity" mode="format_translate"/>
						</xsl:if>
						<xsl:if test="catProc_ru:MeasureUnitQualifierName or catProc_ru:MeasureUnitQualifierCode">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catProc_ru:MeasureUnitQualifierName"/>
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:apply-templates select="catProc_ru:MeasureUnitQualifierCode"/>
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--Замена продуктов переработки эквивалентными товарами (catProc_ru:ProcessingSubstituteGoodsType)-->
	<xsl:template name="Substitute">
		<xsl:param name="node"/>
		<xsl:param name="need_col_5" select="'1'"/>
		<xsl:param name="title_col4" select="'Количество'"/>
		<table class="border">
			<tr class="title">
				<td align="center" width="5%">№</td>
				<td align="center" width="32%">Наименование</td>
				<td align="center" width="15%">Код по ТН ВЭД ЕАЭС</td>
				<td align="center" width="15%">
					<xsl:value-of select="$title_col4"/>
				</td>
				<xsl:if test="$need_col_5='1'">
					<td align="center">Наименование продукта переработки</td>
					<td align="center">Код по ТН ВЭД ЕАЭС</td>
				</xsl:if>
			</tr>
			<tr class="title">
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
				<td align="center">4</td>
				<xsl:if test="$need_col_5='1'">
					<td align="center">5</td>
					<td align="center">6</td>
				</xsl:if>
			</tr>
			<xsl:for-each select="$node">
				<tr class="annot_t">
					<td align="center">
						<xsl:apply-templates select="catProc_ru:GoodsNamber"/>
					</td>
					<td>
						<xsl:apply-templates select="catProc_ru:GoodsDescription"/>
					</td>
					<td>
						<xsl:apply-templates select="catProc_ru:GoodsTNVEDCode"/>
					</td>
					<td>
						<xsl:if test="catProc_ru:GoodsQuantity">
							<xsl:apply-templates select="catProc_ru:GoodsQuantity" mode="format_translate"/>
						</xsl:if>
						<xsl:if test="catProc_ru:MeasureUnitQualifierName or catProc_ru:MeasureUnitQualifierCode">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="catProc_ru:MeasureUnitQualifierName"/>
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:apply-templates select="catProc_ru:MeasureUnitQualifierCode"/>
							<xsl:if test="catProc_ru:MeasureUnitQualifierName and catProc_ru:MeasureUnitQualifierCode">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
					<xsl:if test="$need_col_5='1'">
						<td>
							<xsl:apply-templates select="catProc_ru:ProcGoodsDescription"/>
						</td>
						<td>
							<xsl:apply-templates select="catProc_ru:ProcGoodsTNVEDCode"/>
						</td>
					</xsl:if>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--Сведения о статусе документа и операции-->
	<xsl:template name="Status">
		<table>
			<tbody>
				<tr>
					<td width="25%" class="aling">Статус документа:</td>
					<td width="2%" class="aling"/>
					<td width="73%" class="aling">
						<b>
							<xsl:choose>
								<xsl:when test="apg:DocumentStatus='1'">
									<xsl:text>Черновик</xsl:text>
								</xsl:when>
								<xsl:when test="apg:DocumentStatus='2'">
									<xsl:text>Подготовлено</xsl:text>
								</xsl:when>
								<xsl:when test="apg:DocumentStatus='3'">
									<xsl:text>Действует</xsl:text>
								</xsl:when>
								<xsl:when test="apg:DocumentStatus='4'">
									<xsl:text>Исполнено</xsl:text>
								</xsl:when>
								<xsl:when test="apg:DocumentStatus='5'">
									<xsl:text>Истек срок действия</xsl:text>
								</xsl:when>
								<xsl:when test="apg:DocumentStatus='6'">
									<xsl:text>Аннулировано</xsl:text>
								</xsl:when>
								<xsl:when test="apg:DocumentStatus='7'">
									<xsl:text>Отозвано</xsl:text>
								</xsl:when>
								<xsl:when test="apg:DocumentStatus='8'">
									<xsl:text>Отказано в выдаче</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="apg:DocumentStatus"/>
								</xsl:otherwise>
							</xsl:choose>
						</b>
					</td>
				</tr>
				<tr>
					<td class="aling">Статус операции:</td>
					<td class="aling"/>
					<td class="aling">
						<b>
							<xsl:choose>
								<xsl:when test="apg:OperationStatus='1'">
									<xsl:text>выдача Разрешения на переработку</xsl:text>
								</xsl:when>
								<xsl:when test="apg:OperationStatus='2'">
									<xsl:text>отзыв Разрешения</xsl:text>
								</xsl:when>
								<xsl:when test="apg:OperationStatus='3'">
									<xsl:text>аннулирование Разрешения</xsl:text>
								</xsl:when>
								<xsl:when test="apg:OperationStatus='4'">
									<xsl:text>восстановление Разрешения</xsl:text>
								</xsl:when>
								<xsl:when test="apg:OperationStatus='5'">
									<xsl:text>разрешение на передачу Разрешения на переработку иному лицу</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="apg:DocumentStatus"/>
								</xsl:otherwise>
							</xsl:choose>
						</b>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!--Сведения о Заявителе-->
	<xsl:template name="Applicant_one_str_info">
		<xsl:param name="node"/>
		<xsl:param name="isRecipient" select="'0'"/>
		<table>
			<xsl:choose>
				<xsl:when test="$isRecipient='0'">
					<tr>
						<td class="annot_t">
							<p style="text-indent: {$indent}%;">
								<xsl:text>2. От:</xsl:text>
							</p>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="annot_t">
							<p style="text-indent: {$indent}%;">
								<xsl:text>1.1 Передано:</xsl:text>
							</p>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<xsl:for-each select="$node">
			<table>
				<tr>
					<td class="value">
						<xsl:apply-templates select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:apply-templates select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
						<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
							<xsl:text>, ИНН </xsl:text>
							<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
						</xsl:if>
						<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
							<xsl:text>, ОГРН </xsl:text>
							<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
						</xsl:if>
						<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
							<xsl:text>, КПП </xsl:text>
							<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<xsl:choose>
						<xsl:when test="$isRecipient='0'">
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование заявителя (декларанта), его идентификационный номер налогоплательщика (далее - ИНН), основной государственный регистрационный номер (далее - ОГРН), код причины постановки на учет (далее - КПП))</xsl:text>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование лица, его идентификационный номер налогоплательщика (далее - ИНН), основной государственный регистрационный номер (далее - ОГРН), код причины постановки на учет (далее - КПП))</xsl:text>
							</td>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
				<xsl:if test="RUScat_ru:SubjectAddressDetails[not(RUScat_ru:AddressKindCode) or RUScat_ru:AddressKindCode='1']">
					<tr>
						<td class="annot">
							<xsl:text>Юридический адрес: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="RUScat_ru:SubjectAddressDetails[not(RUScat_ru:AddressKindCode) or RUScat_ru:AddressKindCode='1']">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='3'] or RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='2']">
					<tr>
						<td class="annot">
							<xsl:text>Почтовый адрес и место нахождения: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='3'] | RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='2']">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>;</xsl:text><br/>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="//apg:ProcessingProcedureCode='21'">
					<tr>
						<td class="annot">
							<xsl:text>Место нахождения производственных мощностей: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="apg:FactoryPlace">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td class="annot">
						<xsl:text>Адрес электронной почты, номер (номера) телефона (телефонов), факс, телекс: </xsl:text>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:for-each select="RUScat_ru:CommunicationDetails">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
							</xsl:if>
						</xsl:for-each>
						<br/>
					</td>
				</tr>
				<xsl:choose>
					<xsl:when test="apg:BankReqInfo">
						<xsl:for-each select="apg:BankReqInfo">
							<tr>
								<td class="annot">
									<xsl:text>Наименование банка: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="cat_ru:OrganizationName"/>
									<xsl:if test="cat_ru:ShortName">
										<xsl:if test="cat_ru:OrganizationName">
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:apply-templates select="cat_ru:ShortName"/>
										<xsl:if test="cat_ru:OrganizationName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:if test="catProc_ru:BankMFO">
										<xsl:text>, МФО: </xsl:text>
										<xsl:apply-templates select="catProc_ru:BankMFO"/>
									</xsl:if>
									<xsl:if test="catProc_ru:OKPOID">
										<xsl:text>, ОКПО: </xsl:text>
										<xsl:apply-templates select="catProc_ru:OKPOID"/>
									</xsl:if>
									<xsl:if test="catProc_ru:BICID">
										<xsl:text>, БИК: </xsl:text>
										<xsl:apply-templates select="catProc_ru:BICID"/>
									</xsl:if>
									<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
										<xsl:text>, ИНН: </xsl:text>
										<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
									<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										<xsl:text>, КПП: </xsl:text>
										<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										<xsl:text>, ОГРН: </xsl:text>
										<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="underline" align="center">
									<xsl:text>(полное и сокращенное наименование, ИНН, КПП, ОГРН)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<xsl:text>Рублевый счет  (счета): </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="catProc_ru:BankAccountRUB">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<xsl:text>Валютный счет (счета): </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="catProc_ru:BankAccountVAL">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td class="annot">
								<xsl:text>Наименование банка (банков): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value">
								<br/>
							</td>
						</tr>
						<tr>
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование, ИНН, КПП, ОГРН)</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<xsl:text>Рублевый счет  (счета): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value">
								<br/>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<xsl:text>Валютный счет (счета): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value">
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="//apg:ProcessingProcedureCode='51'">
					<tr>
						<td class="annot">
							<xsl:text>Место нахождения производственных мощностей: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="apg:FactoryPlace">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
			</table>
		</xsl:for-each>
	</xsl:template>
	<!--Сведения о Заявителе-->
	<xsl:template name="Applicant_several_str_info">
		<xsl:param name="node"/>
		<xsl:param name="isRecipient" select="'0'"/>
		<table>
			<xsl:choose>
				<xsl:when test="$isRecipient='0'">
					<tr>
						<td class="annot_t">
							<p style="text-indent: {$indent}%;">
								<xsl:text>2. От:</xsl:text>
							</p>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="annot_t">
							<p style="text-indent: {$indent}%;">
								<xsl:text>1.1 Передано:</xsl:text>
							</p>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
		<xsl:for-each select="$node">
			<table>
				<tr>
					<td class="value">
						<xsl:apply-templates select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:apply-templates select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<xsl:choose>
						<xsl:when test="$isRecipient='0'">
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование заявителя)</xsl:text>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование лица)</xsl:text>
							</td>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
				<tr>
					<td class="annot">
						<table>
							<tr>
								<td class="annot" width="70%">
									<xsl:text>Идентификационный номер налогоплательщика (далее - ИНН): </xsl:text>
								</td>
								<td class="value" width="30%">
									<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<xsl:text>Код причины постановки на учет (далее - КПП): </xsl:text>
								</td>
								<td class="value">
									<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<xsl:text>Основной государственный регистрационный номер (далее - ОГРН): </xsl:text>
								</td>
								<td class="value">
									<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<xsl:if test="RUScat_ru:SubjectAddressDetails[not(RUScat_ru:AddressKindCode) or RUScat_ru:AddressKindCode='1']">
					<tr>
						<td class="annot">
							<xsl:text>Юридический адрес: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="RUScat_ru:SubjectAddressDetails[not(RUScat_ru:AddressKindCode) or RUScat_ru:AddressKindCode='1']">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='3']">
					<tr>
						<td class="annot">
							<xsl:text>Почтовый адрес: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='3']">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='2']">
					<tr>
						<td class="annot">
							<xsl:text>Адрес местонахождения: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="RUScat_ru:SubjectAddressDetails[RUScat_ru:AddressKindCode='2']">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="//apg:ProcessingProcedureCode='51'">
					<tr>
						<td class="annot">
							<xsl:text>Место нахождения производственных мощностей: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="apg:FactoryPlace">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td class="annot">
						<xsl:text>Адрес электронной почты, номер (номера) телефона (телефонов), факс, телекс: </xsl:text>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:for-each select="RUScat_ru:CommunicationDetails">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
							</xsl:if>
						</xsl:for-each>
						<br/>
					</td>
				</tr>
				<xsl:choose>
					<xsl:when test="apg:BankReqInfo">
						<xsl:for-each select="apg:BankReqInfo">
							<tr>
								<td class="annot">
									<xsl:text>Наименование банка: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="cat_ru:OrganizationName"/>
									<xsl:if test="cat_ru:ShortName">
										<xsl:if test="cat_ru:OrganizationName">
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:apply-templates select="cat_ru:ShortName"/>
										<xsl:if test="cat_ru:OrganizationName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:if test="catProc_ru:BankMFO">
										<xsl:text>, МФО: </xsl:text>
										<xsl:apply-templates select="catProc_ru:BankMFO"/>
									</xsl:if>
									<xsl:if test="catProc_ru:OKPOID">
										<xsl:text>, ОКПО: </xsl:text>
										<xsl:apply-templates select="catProc_ru:OKPOID"/>
									</xsl:if>
									<xsl:if test="catProc_ru:BICID">
										<xsl:text>, БИК: </xsl:text>
										<xsl:apply-templates select="catProc_ru:BICID"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="underline" align="center">
									<xsl:text>(полное и сокращенное наименование)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<table>
										<tr>
											<td class="annot" width="20%">
												<xsl:text>ИНН: </xsl:text>
											</td>
											<td class="value" width="80%">
												<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</td>
										</tr>
										<tr>
											<td class="annot">
												<xsl:text>КПП: </xsl:text>
											</td>
											<td class="value">
												<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											</td>
										</tr>
										<tr>
											<td class="annot">
												<xsl:text>ОГРН: </xsl:text>
											</td>
											<td class="value">
												<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<xsl:text>Рублевый счет (счета): </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="catProc_ru:BankAccountRUB">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="annot">
									<xsl:text>Валютный счет (счета): </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="catProc_ru:BankAccountVAL">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td class="annot">
								<xsl:text>Наименование банка (банков): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value">
								<br/>
							</td>
						</tr>
						<tr>
							<td class="underline" align="center">
								<xsl:text>(полное и сокращенное наименование)</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<table>
									<tr>
										<td class="annot" width="20%">
											<xsl:text>ИНН: </xsl:text>
										</td>
										<td class="value" width="80%">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="annot">
											<xsl:text>КПП: </xsl:text>
										</td>
										<td class="value">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="annot">
											<xsl:text>ОГРН: </xsl:text>
										</td>
										<td class="value">
											<br/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<xsl:text>Рублевый счет (счета): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value">
								<br/>
							</td>
						</tr>
						<tr>
							<td class="annot">
								<xsl:text>Валютный счет (счета): </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value">
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="apg:ProcessingProcedureCode='51'">
					<tr>
						<td class="annot">
							<xsl:text>Адрес местонахождения производственных мощностей: </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="value">
							<xsl:for-each select="apg:FactoryPlace">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<br/>
						</td>
					</tr>
				</xsl:if>
			</table>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:ProcessingOrganizationType -->
	<xsl:template match=" apg:ProcOrganization" mode="tbl_whith_underline">
		<xsl:param name="num_pp" select="'0'"/>
		<xsl:param name="position" select="'0'"/>
		<xsl:variable name="ProcessingProcedureCode" select="../../apg:ProcessingProcedureCode"/>
		<xsl:variable name="npp">
			<xsl:choose>
				<xsl:when test="$position!='0' and $num_pp!='0'">
					<xsl:value-of select="$num_pp"/>
					<xsl:text>(</xsl:text>
					<xsl:value-of select="$position"/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$position='0' and $num_pp!='0'">
					<xsl:value-of select="$num_pp"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$position!='0'">
			<table>
				<tr>
					<td class="annot">
						<p style="text-indent: {$indent}%;">
							<xsl:value-of select="$npp"/>
						</p>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table>
			<tr>
				<td class="value">
					<xsl:apply-templates select="cat_ru:OrganizationName"/>
					<xsl:if test="cat_ru:ShortName">
						<xsl:if test="cat_ru:OrganizationName">
							<xsl:text> (</xsl:text>
						</xsl:if>
						<xsl:apply-templates select="cat_ru:ShortName"/>
						<xsl:if test="cat_ru:OrganizationName">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</xsl:if>
					<xsl:if test="(cat_ru:OrganizationName or cat_ru:ShortName) and cat_ru:RFOrganizationFeatures">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:for-each select="cat_ru:RFOrganizationFeatures">
						<xsl:for-each select="*">
							<xsl:choose>
								<xsl:when test="local-name()='INN'">ИНН: </xsl:when>
								<xsl:when test="local-name()='KPP'">КПП: </xsl:when>
								<xsl:when test="local-name()='OGRN'">ОГРН: </xsl:when>
							</xsl:choose>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td class="underline" align="center">
					<xsl:text>(полное и сокращенное наименование, ИНН)</xsl:text>
				</td>
			</tr>
			<tr>
				<td class="annot">
					<xsl:text>Место нахождения, почтовый адрес: </xsl:text>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:Address">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
			<tr>
				<td class="annot">
					<xsl:text>Адрес электронной почты, номер (номера) телефона (телефонов), факс, телекс: </xsl:text>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:Contact">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
			<tr>
				<td class="annot">
					<xsl:text>Адрес местонахождения производственных мощностей: </xsl:text>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:FactoryPlace">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
		</table>
		<br/>
		<table>
			<tr>
				<td class="annot_t">
					<p style="text-indent: {$indent}%;text-align:justify">
						<xsl:value-of select="$npp"/>
						<xsl:choose>
							<xsl:when test="$ProcessingProcedureCode='21'">
								<xsl:text>.1 Документы, на основании которых товары ЕАЭС предполагается помещать под таможенную процедуру переработки вне таможенной территории:</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>.1 Документы, на основании которых иностранные товары будут передаваться лицу (лицам), осуществляющему (им) операции по переработке:</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</p>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:Contract">
						<xsl:apply-templates select="." mode="doc"/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
			<td class="underline" align="center">
				<xsl:choose>
					<xsl:when test="$ProcessingProcedureCode='21'">
						<xsl:text>(наименование(ия), (номер(а) и дата(ы) их подписания)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>(реквизиты договора (договоров), заключенного(ых) с лицом (лицами), которое(ые) будут непосредственно осуществлять операции по переработке товаров)</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</table>
		<xsl:if test="$ProcessingProcedureCode!='21'">
			<br/>
			<table>
				<tr>
					<td class="annot_t">
						<p style="text-indent: {$indent}%;text-align: justify;">
							<xsl:value-of select="$npp"/>
							<xsl:text>.2 Иностранные товары, поступающие для совершения операций по переработке лицу, непосредственно осуществляющему </xsl:text>
							<xsl:text>операции по переработке товаров (организации-переработчику):</xsl:text>
						</p>
					</td>
				</tr>
			</table>
			<br/>
			<xsl:variable name="OrgName">
				<xsl:choose>
					<xsl:when test="cat_ru:ShortName">
						<xsl:apply-templates select="cat_ru:ShortName"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="cat_ru:OrganizationName"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="GoodsTblType1">
				<xsl:with-param name="node" select="catProc_ru:ProcessingGoods"/>
				<xsl:with-param name="need_col_sum" select="'0'"/>
				<xsl:with-param name="need_OrgName" select="'1'"/>
				<xsl:with-param name="OrgName" select="$OrgName"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:ProcessingOrganizationType -->
	<xsl:template match=" apg:ProcOrganization" mode="tbl_NOT_underline">
		<xsl:param name="num_pp" select="'0'"/>
		<xsl:param name="position" select="'0'"/>
		<xsl:variable name="ProcessingProcedureCode" select="../../apg:ProcessingProcedureCode"/>
		<xsl:variable name="npp">
			<xsl:choose>
				<xsl:when test="$position!='0' and $num_pp!='0'">
					<xsl:value-of select="$num_pp"/>
					<xsl:text>(</xsl:text>
					<xsl:value-of select="$position"/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$position='0' and $num_pp!='0'">
					<xsl:value-of select="$num_pp"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$position!='0'">
			<table>
				<tr>
					<td class="annot">
						<p style="text-indent: {$indent}%;">
							<xsl:value-of select="$npp"/>
						</p>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table>
			<tr>
				<td class="annot" style="text-align: justify;">
					<xsl:text>полное и краткое наименование: </xsl:text>
					<span class="value">
						<xsl:apply-templates select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName">
								<xsl:text> (</xsl:text>
							</xsl:if>
							<xsl:apply-templates select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:if>
						<xsl:if test="(cat_ru:OrganizationName or cat_ru:ShortName) and cat_ru:RFOrganizationFeatures">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:for-each select="cat_ru:RFOrganizationFeatures">
							<xsl:for-each select="*">
								<xsl:choose>
									<xsl:when test="local-name()='INN'">ИНН: </xsl:when>
									<xsl:when test="local-name()='KPP'">КПП: </xsl:when>
									<xsl:when test="local-name()='OGRN'">ОГРН: </xsl:when>
								</xsl:choose>
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</xsl:for-each>
					</span>
				</td>
			</tr>
			<tr>
				<td class="annot" style="text-align: justify;">
					<xsl:text>место нахождения: </xsl:text>
					<span class="value">
						<xsl:for-each select="catProc_ru:Address">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</span>
				</td>
			</tr>
			<tr>
				<td class="annot" style="text-align: justify;">
					<xsl:text>место нахождения его (их) производственных мощностей: </xsl:text>
					<span class="value">
						<xsl:for-each select="catProc_ru:FactoryPlace">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</span>
				</td>
			</tr>
			<tr>
				<td class="annot" style="text-align: justify;">
					<xsl:text>адрес электронной почты, телефон(ы), факс: </xsl:text>
					<span class="value">
						<xsl:for-each select="catProc_ru:Contact">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>; </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</span>
				</td>
			</tr>
		</table>
		<br/>
		<table>
			<tr>
				<td class="annot_t">
					<p style="text-indent: {$indent}%;text-align:justify">
						<xsl:value-of select="$npp"/>
						<xsl:choose>
							<xsl:when test="$ProcessingProcedureCode='21'">
								<xsl:text>.1 Документы, на основании которых товары Евразийского экономического союза будут передаваться лицу (лицам), осуществляющему (им) операции по переработке:</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>.1 Документы, на основании которых иностранные товары будут передаваться лицу (лицам), осуществляющему (им) операции по переработке:</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</p>
				</td>
			</tr>
			<tr>
				<td class="value">
					<xsl:for-each select="catProc_ru:Contract">
						<xsl:apply-templates select="." mode="doc"/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</td>
			</tr>
			<td class="underline" align="center">
				<xsl:choose>
					<xsl:when test="$ProcessingProcedureCode='21'">
						<xsl:text>(наименование(ия), номер(а) и дата(ы) их подписания)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>(реквизиты договора (договоров),  заключенного(ых) с лицом (лицами), которое(ые) будут непосредственно осуществлять операции по переработке  товаров)</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</table>
		<xsl:if test="$ProcessingProcedureCode!='21'">
			<br/>
			<table>
				<tr>
					<td class="annot_t">
						<p style="text-indent: {$indent}%;text-align: justify;">
							<xsl:value-of select="$npp"/>
							<xsl:text>.2 Иностранные товары, поступающие для совершения операций по переработке лицу, непосредственно осуществляющему </xsl:text>
							<xsl:text>операции по переработке товаров (организации-переработчику):</xsl:text>
						</p>
					</td>
				</tr>
			</table>
			<br/>
			<xsl:variable name="OrgName">
				<xsl:choose>
					<xsl:when test="cat_ru:ShortName">
						<xsl:apply-templates select="cat_ru:ShortName"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="cat_ru:OrganizationName"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="GoodsTblType1">
				<xsl:with-param name="node" select="catProc_ru:ProcessingGoods"/>
				<xsl:with-param name="need_col_sum" select="'0'"/>
				<xsl:with-param name="need_OrgName" select="'1'"/>
				<xsl:with-param name="OrgName" select="$OrgName"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- cat_ru:PersonSignatureType -->
	<xsl:template match="apg:PersonSignature">
		<xsl:param name="fio_descr" select="''"/>
		<table>
			<tbody>
				<tr>
					<td class="value" width="50%" align="center">
						<xsl:if test="cat_ru:PersonPost">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="cat_ru:PersonName"/>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</xsl:if>
					</td>
					<td class="annot" width="3%"/>
					<td class="value" width="24%"/>
					<td class="annot" width="3%"/>
					<td class="value" width="20%" align="center">
						<xsl:if test="cat_ru:IssueDate">
							<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="underline" align="center">
						<xsl:value-of select="$fio_descr"/>
					</td>
					<td class="underline"/>
					<td class="underline" align="center">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td class="underline"/>
					<td class="underline" align="center">
						<xsl:text>(дата)</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="underline" colspan="5">
						<br/>
					</td>
				</tr>
				<tr>
					<td class="annot" colspan="5">
						<xsl:text>Место печати (при наличии)</xsl:text>
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails|catProc_ru:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType или cat_ru:AddressType-->
	<xsl:template match="RUScat_ru:SubjectAddressDetails | apg:FactoryPlace | catProc_ru:Address | catProc_ru:FactoryPlace">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:choose>
				<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
				<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:for-each select="*">
			<xsl:if test="local-name()='PostalCode'">Почтовый индекс: </xsl:if>
			<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
			<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
			<xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
			<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
			<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if>
			<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
			<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='CountryCode'">
					<xsl:if test="not(../RUScat_ru:CounryName) and not(../cat_ru:CounryName)">
						<xsl:apply-templates select="."/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="local-name()!='AddressKindCode'">
						<xsl:apply-templates select="."/>
						<xsl:if test="local-name()='CounryName'">
							<xsl:if test="../RUScat_ru:CountryCode"> (<xsl:apply-templates select="../RUScat_ru:CountryCode"/>)</xsl:if>
							<xsl:if test="../cat_ru:CountryCode"> (<xsl:apply-templates select="../cat_ru:CountryCode"/>)</xsl:if>
						</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:if test="local-name()!='AddressKindCode'">
					<xsl:if test="local-name()!='CountryCode' or (local-name()='CountryCode' and not(../RUScat_ru:CounryName) and not(../cat_ru:CounryName))">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:PermitNumberType -->
	<xsl:template match="apg:PermitNumber">
		<xsl:apply-templates select="catProc_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="catProc_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="catProc_ru:ProcessingProcedureCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="catProc_ru:Number"/>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
