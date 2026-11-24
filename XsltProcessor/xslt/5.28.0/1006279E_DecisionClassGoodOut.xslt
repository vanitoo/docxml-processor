<?xml version="1.0" encoding="UTF-8"?>
<!--Проект приказа ФТС России "Об утверждении формы решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза, формы решения об изменении решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза, порядков их заполнения, а также порядков и сроков принятия указанных решений" 
Приложение №1 (DCGOType=0) 
Приказ ФТС России от 31.01.2019 №156 "Об утверждении формы решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза, формы решения об изменении решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза, порядков их заполнения, а также порядков и сроков принятия указанных решений" 
Приложение №1 (DCGOType=1)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:dco="urn:customs.ru:Information:CustomsDocuments:DecisionClassGoodOut:5.28.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="dco:DecisionClassGoodOut">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<title>Решение по классификации товара по ТН ВЭД ЕАЭС</title>
				<style type="text/css">
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.page1
					{/*width: 297mm;*/
					/*height: 297mm;*/
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.space
					{width: 30px;}

					.marg-top
					{margin-top: 5mm;}

					.marg-top2
					{margin-top: 3mm;
					font-weight: bold;}

					.spec_column
					{border-bottom: 0px; 
					border-left: 0px; 
					border-right: 0px; 
					font-size: 10pt;}

					.header
					{ont-weight: bold;}

					.docs td
					{padding: 5px}

					.goods tr td
					{vertical-align: top;
					padding: 5px;}

					.main tr td
					{vertical-align: top;}

					.content
					{margin-top:10px; 
					margin-left: 15px;
					margin-bottom: 15px;}

					table
					{width: 100%;
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display: -moz-inline-stack;/*Firefox 2*/
					display: inline-table; /*Хорошие браузеры*/
					_overflow: hidden;/*IE6, IE7*/
					*zoom: 1;/*включаем hasLayout для IE6, IE7*/
					*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					div.title, tr.title td
					{font-weight:bold;}

					.border
					{border: 1px solid;}

					.bordered
					{border-collapse: collapse;}

					.bordered2
					{border-bottom: 1px solid;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align: top;}

					td.value.graphMain
					{vertical-align: bottom;}
	
					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align: top;}

					.indent
					{text-indent: 1.5em;}

					.delim_3
					{height: 3pt;}

					.graphLittle
					{font-size: 7pt;
					text-align: center;
					vertical-align: top;}

					.delim_3
					{height: 3pt;}

					.graphMain
					{font-family: Arial;
					font-size: 11pt;}

					@media print
					{div.page
					{border: none;}}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain">
						<tbody>
							<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">
								<tr>
									<td align="center" class="title">
										<font face="Times new roman" size="5">
											<xsl:text>МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ</xsl:text><br/><br/><xsl:text>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
										</font>
										<br/>
										<br/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b><xsl:text>РЕШЕНИЕ</xsl:text><br/><xsl:text>О КЛАССИФИКАЦИИ ТОВАРА В СООТВЕТСТВИИ С ЕДИНОЙ ТОВАРНОЙ</xsl:text><br/><xsl:text>НОМЕНКЛАТУРОЙ ВНЕШНЕЭКОНОМИЧЕСКОЙ ДЕЯТЕЛЬНОСТИ ЕВРАЗИЙСКОГО ЭКОНОМИЧЕСКОГО СОЮЗА</xsl:text></b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="graphMain">
						<tbody>
							<tr>
								<td valign="top" class="bordered" width="50%">
								1. Наименование таможенного органа, принявшего решение о классификации товара <br/>
									<br/>
									<i>
										<xsl:value-of select="dco:Customs/dco:Code"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="dco:Customs/dco:OfficeName"/>
									</i>
								</td>
								<td valign="top" class="bordered" width="50%">
								<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">2. Полное наименование либо Ф.И.О (отчество при наличии) декларанта</xsl:if>
								<xsl:if test="dco:DCGOType='true' or dco:DCGOType='1'">2. Сведения о декларанте</xsl:if>
								<br/>
									<br/>
									<i>
										<xsl:apply-templates select="dco:Declarant" mode="organization"/>
										<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">
											<xsl:if test="dco:Declarant/dco:SeparateDivision">
												<br/>
												<br/>
												Обособленное подразделение:
												<br/>
												<xsl:apply-templates select="dco:Declarant/dco:SeparateDivision" mode="organization"/>
											</xsl:if>
										</xsl:if>
									</i>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered">
								3. Регистрационный номер решения о классификации товара
								<br/>
									<br/>
									<i>
									РКТ-<xsl:value-of select="dco:RegistrationNumber/dco:CustomsCode"/>-<xsl:value-of select="substring(dco:RegistrationNumber/dco:Date,3,2)"/>/<xsl:value-of select="dco:RegistrationNumber/dco:SerialNumber"/><xsl:value-of select="dco:RegistrationNumber/dco:DocKind"/>
										<!--	<xsl:value-of select="dco:RegistrationNumber/dco:CaseNomenclatureNumber"/>/-->
									</i>
								</td>
								<td valign="top" class="bordered">
								4. Дата принятия решения о классификации товара
								<br/>
									<br/>
									<i>
										<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="dco:RegistrationNumber/dco:Date"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
										</xsl:if>
										<xsl:if test="dco:DCGOType='true' or dco:DCGOType='1'">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
											<xsl:for-each select="dco:RegistrationNumber/dco:Date">
												<xsl:call-template name="Date"/>
											</xsl:for-each>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
										</xsl:if>
									</i>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered">5. Наименование товара<br/>
									<br/>
									<i>
										<xsl:for-each select="dco:Goods/dco:GoodDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
									</i>
								</td>
								<td valign="top" class="bordered">6. Десятизначный классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза<br/>
									<br/>
									<i>
										<xsl:call-template name="TNVEDCode">
											<xsl:with-param name="str" select="dco:TNVEDCode"/>
										</xsl:call-template>
									</i>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="2">
								7. Сведения, необходимые для классификации товара
								<br/>
									<br/>
									<i>
										<!--xsl:for-each select="dco:Goods/dco:GoodDescription">
											<xsl:apply-templates select="."/>
										</xsl:for-each-->
										<xsl:if test="dco:Goods/dco:AdditionalInformation">
											<xsl:for-each select="dco:Goods/dco:AdditionalInformation">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<br/><br/>
										</xsl:if>
										<xsl:for-each select="dco:Goods/dco:GoodsInformation">
											<xsl:for-each select="*[local-name()='Manufacturer' or local-name()='TradeMark' or local-name()='GoodsMark' or local-name()='GoodsModel' or local-name()='GoodsMarking' or local-name()='GoodsStandard' or local-name()='GoodsSort' or local-name()='WoodDescriptionDetails' or local-name()='Dimensions' or local-name()='DateIssue' or local-name()='SerialNumber']">
												<xsl:if test="local-name()='Manufacturer'">
													<xsl:text>производитель: </xsl:text>
												</xsl:if>
												<xsl:if test="local-name()='GoodsMark'">
													<xsl:text>марка: </xsl:text>
												</xsl:if>
												<xsl:if test="local-name()='GoodsModel'">
													<xsl:text>модель: </xsl:text>
												</xsl:if>
												<xsl:if test="local-name()='GoodsSort'">
													<xsl:text>сорт: </xsl:text>
												</xsl:if>
												<xsl:if test="local-name()='GoodsMarking'">
													<xsl:text>артикул: </xsl:text>
												</xsl:if>
												<xsl:if test="local-name()='TradeMark'">
													<xsl:text>товарный знак: </xsl:text>
												</xsl:if>
												<xsl:if test="local-name()='GoodsStandard'">
													<xsl:text>ГОСТ/ТУ: </xsl:text>
												</xsl:if>
												<xsl:if test="position()!=1 and local-name()!='SerialNumber'"><xsl:text> </xsl:text></xsl:if>
												<xsl:choose>
													<xsl:when test="local-name()='WoodDescriptionDetails'">
														<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
													</xsl:when>
													<xsl:when test="local-name()='DateIssue'">
														<xsl:text>дата выпуска: </xsl:text>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="."/>
														</xsl:call-template> 
													</xsl:when>
													<xsl:when test="local-name()='Dimensions'">
														<xsl:text>размеры: </xsl:text>
														<xsl:apply-templates mode="Dimensions" select="."/>
													</xsl:when>
													<xsl:when test="local-name()='SerialNumber' and not(preceding-sibling::*[local-name()='SerialNumber'])">
														<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
														<!--для unbounted элемента SerialNumber выведем сразу все, как только всетретили первый (это надо, чтобы не делать лишних пробелов между ними)-->
														<xsl:apply-templates select="../*[local-name()='SerialNumber']"/>
														<!--xsl:for-each select="../*[local-name()='SerialNumber']">
															<xsl:value-of select="."/>
														</xsl:for-each-->
													</xsl:when>
													<xsl:otherwise>
														<xsl:if test="local-name()!='SerialNumber'">
															<xsl:apply-templates select="."/>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:if test="position()!=last()">; </xsl:if>
											</xsl:for-each>
											<xsl:if test="position() != last()"><br/></xsl:if>
											<xsl:if test="position() = last()"><br/><br/></xsl:if>
										</xsl:for-each>
									</i>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="2">
								8. Обоснование принятия решения о классификации товара                          
								<br/>
									<br/>
								8.1.&#160;Решение принято в соответствии с Основными правилами интерпретации Товарной номенклатуры внешнеэкономической деятельности <i>
										<u>
											<xsl:choose>
												<xsl:when test="dco:DecisionClass/dco:InterpretationRules">
													<xsl:value-of select="dco:DecisionClass/dco:InterpretationRules"/>
												</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u>
									</i>
									<br/>
									<br/>
									8.2.&#160;Заключение <i>
										<u>
											<xsl:choose>
												<xsl:when test="dco:ExpertDecision/dco:ExpertOrganization">
													<xsl:value-of select="dco:ExpertDecision/dco:ExpertOrganization"/>
												</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u> от <u>
											<xsl:choose>
												<xsl:when test="dco:ExpertDecision/cat_ru:PrDocumentDate">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="dco:ExpertDecision/cat_ru:PrDocumentDate"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u>&#160;№
										<u>
											<xsl:choose>
												<xsl:when test="dco:ExpertDecision/cat_ru:PrDocumentNumber">
													<xsl:value-of select="dco:ExpertDecision/cat_ru:PrDocumentNumber"/>
												</xsl:when>
												<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
											</xsl:choose>
										</u>
									</i>
									<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">
										<br/>
										<br/>
										<xsl:text>8.3.&#160;</xsl:text>
										<!--xsl:choose>
											<xsl:when test="dco:DecisionClass/dco:InspectionType='1' or dco:DepartmentalControl"><xsl:text>Результаты проведения проверки таможенных, иных документов и (или) сведений</xsl:text></xsl:when>
											<xsl:otherwise><xsl:text>&#8211;</xsl:text></xsl:otherwise>
										</xsl:choose-->
										<xsl:if test="not(dco:DecisionClass/dco:DepartmentalControl)">
											<xsl:text>&#8211;</xsl:text>
										</xsl:if>
										<xsl:if test="dco:DecisionClass/dco:DepartmentalControl">
											<xsl:text>Результаты проведения проверки таможенных, иных документов и (или) сведений:</xsl:text>
											<br/>
											<xsl:value-of select="dco:DecisionClass/dco:DepartmentalControl"/>
										</xsl:if>
										<br/>
										<br/>
										<xsl:text>8.4.&#160;</xsl:text>
										<!--xsl:choose>
											<xsl:when test="dco:DecisionClass/dco:InspectionType='2' or dco:CustomsControl"><xsl:text>Результаты проведения таможенной проверки</xsl:text></xsl:when>
											<xsl:otherwise><xsl:text>&#8211;</xsl:text></xsl:otherwise>
										</xsl:choose-->
										<xsl:if test="not(dco:DecisionClass/dco:CustomsControl)">
											<xsl:text>&#8211;</xsl:text>
										</xsl:if>
										<xsl:if test="dco:DecisionClass/dco:CustomsControl">
											<xsl:text>Результаты проведения таможенной проверки:</xsl:text>
											<br/>
											<xsl:value-of select="dco:DecisionClass/dco:CustomsControl"/>
										</xsl:if>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="2">
									<xsl:text>9. Для служебных отметок </xsl:text>
									<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:IsPartialGood='true' or dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:IsPartialGood='1' or dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:IsPartialGood='t'">
											<xsl:choose>
												<xsl:when test="count(dco:Goods/dco:DTList)>1 and (dco:DCGOType='false' or dco:DCGOType='0')">
													<xsl:for-each select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:GoodsNumeric">
														<xsl:text>9.1.</xsl:text>
														<xsl:value-of select="position()"/>
														<xsl:text>.</xsl:text>
														<xsl:if test="../dco:ObjectOrdinal">
															<xsl:text> Накладная № </xsl:text>
															<xsl:value-of select="../dco:ObjectOrdinal"/>
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:text>&#160;Часть товара №&#160;</xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:value-of select="."/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<xsl:text> по таможенной декларации № </xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:apply-templates select="../../dco:DTNum" mode="gtd_num"/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<br/>
													</xsl:for-each>
												</xsl:when>
												<xsl:when test="count(dco:Goods/dco:DTList)>1 and (dco:DCGOType='true' or dco:DCGOType='1')">
													<xsl:for-each select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:GoodsNumeric">
														<xsl:text>9.1.</xsl:text>
														<xsl:value-of select="position()"/>
														<xsl:text>.</xsl:text>
														<xsl:if test="../dco:ObjectOrdinal">
															<xsl:text> Накладная № </xsl:text>
															<xsl:value-of select="../dco:ObjectOrdinal"/>
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:text>&#160;Часть товара №&#160;</xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:value-of select="."/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<xsl:text> по декларации на товары № </xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:apply-templates select="../../dco:DTNum" mode="gtd_num"/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<br/>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>9.1.</xsl:text>
													<xsl:if test="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:ObjectOrdinal">
														<xsl:text> Накладная № </xsl:text>
														<xsl:value-of select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:ObjectOrdinal"/>
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:text>&#160;Часть товара №&#160;</xsl:text>
													<span class="value">
														<xsl:text>&#160;&#160;</xsl:text>
														<xsl:value-of select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:GoodsNumeric"/>
														<xsl:text>&#160;&#160;</xsl:text>
													</span>
													<xsl:text>, № документа (таможенной декларации или другого документа, используемого в качестве таможенной декларации), в котором таможенным органом выявлен неверный классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза</xsl:text>
													<span class="value">
														<xsl:text>&#160;&#160;&#160;</xsl:text>
														<xsl:for-each select="dco:Goods/dco:DTList/dco:DTNum">
															<xsl:apply-templates select="." mode="gtd_num"/>
														</xsl:for-each>
														<xsl:text>&#160;&#160;&#160;</xsl:text>
													</span>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:when test="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:IsPartialGood='false' or dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:IsPartialGood='0' or dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:IsPartialGood='f'">
											<xsl:choose>
												<xsl:when test="count(dco:Goods/dco:DTList)>1 and (dco:DCGOType='false' or dco:DCGOType='0')">
													<xsl:for-each select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:GoodsNumeric">
														<xsl:text>9.1.</xsl:text>
														<xsl:value-of select="position()"/>
														<xsl:text>.</xsl:text>
														<xsl:if test="../dco:ObjectOrdinal">
															<xsl:text> Накладная № </xsl:text>
															<xsl:value-of select="../dco:ObjectOrdinal"/>
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:text>&#160;Товар №&#160;</xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:value-of select="."/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<xsl:text> по таможенной декларации № </xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:apply-templates select="../../dco:DTNum" mode="gtd_num"/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<br/>
													</xsl:for-each>
												</xsl:when>
												<xsl:when test="count(dco:Goods/dco:DTList)>1 and (dco:DCGOType='true' or dco:DCGOType='1')">
													<xsl:for-each select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:GoodsNumeric">
														<xsl:text>9.1.</xsl:text>
														<xsl:value-of select="position()"/>
														<xsl:text>.</xsl:text>
														<xsl:if test="../dco:ObjectOrdinal">
															<xsl:text> Накладная № </xsl:text>
															<xsl:value-of select="../dco:ObjectOrdinal"/>
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:text>&#160;Товар №&#160;</xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:value-of select="."/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<xsl:text> по декларации на товары № </xsl:text>
														<span class="value">
															<xsl:text>&#160;&#160;</xsl:text>
															<xsl:apply-templates select="../../dco:DTNum" mode="gtd_num"/>
															<xsl:text>&#160;&#160;</xsl:text>
														</span>
														<br/>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>9.1.</xsl:text>
													<xsl:if test="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:ObjectOrdinal">
														<xsl:text> Накладная № </xsl:text>
														<xsl:value-of select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:ObjectOrdinal"/>
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:text>&#160;Товар №&#160;</xsl:text>
													<span class="value">
														<xsl:text>&#160;&#160;</xsl:text>
														<xsl:value-of select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:GoodsNumeric"/>
														<xsl:text>&#160;&#160;</xsl:text>
													</span>
													<xsl:text>, № документа (таможенной декларации или другого документа, используемого в качестве таможенной декларации), в котором таможенным органом выявлен неверный классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза</xsl:text>
													<span class="value">
														<xsl:text>&#160;&#160;&#160;</xsl:text>
														<xsl:for-each select="dco:Goods/dco:DTList/dco:DTNum">
															<xsl:apply-templates select="." mode="gtd_num"/>
														</xsl:for-each>
														<xsl:text>&#160;&#160;&#160;</xsl:text>
													</span>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
									</xsl:choose>
									<br/>
									<br/>
									<xsl:text>9.2.&#160;Заявленный код товара </xsl:text>
									<span class="value">
										<xsl:text>&#160;&#160;&#160;</xsl:text>
											<xsl:for-each select="dco:Goods/dco:DTList/dco:Numeric_TNVEDCode/dco:TNVEDCode">
												<xsl:call-template name="TNVEDCode">
													<xsl:with-param name="str" select="."/>
												</xsl:call-template>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
										<xsl:text>&#160;&#160;&#160;</xsl:text>
									</span> в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза
									<!--u>
										<xsl:choose>
											<xsl:when test="dco:Goods//dco:TNVEDCode">
											<xsl:for-each select="dco:Goods/dco:Numeric_TNVEDCode">
												<xsl:value-of select="dco:TNVEDCode"/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									</u>
									<xsl:text> в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза</xsl:text-->
									<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">
										<br/>
										<br/>
										9.3.&#160;
										<!--xsl:if test="dco:DecisionClass/dco:InspectionType!='1' or not(dco:DecisionClass/dco:InspectionType)"><xsl:text>&#8211;</xsl:text></xsl:if>
										<xsl:if test="dco:DecisionClass/dco:InspectionType='1'">Акт проверки таможенных, иных документов и (или) сведений от 
											<u>
												<xsl:choose>
													<xsl:when test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u><xsl:text> №&#160;</xsl:text>
											<u>
												<xsl:choose>
													<xsl:when test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber">
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber"/>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u>
										</xsl:if-->
										<xsl:if test="not(dco:DecisionClass/dco:InspectionDetails)"><xsl:text>&#8211;</xsl:text></xsl:if>
										<xsl:if test="dco:DecisionClass/dco:InspectionDetails">Акт проверки таможенных, иных документов и (или) сведений от 
											<u>
												<xsl:choose>
													<xsl:when test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u><xsl:text> №&#160;</xsl:text>
											<u>
												<xsl:choose>
													<xsl:when test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber">
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber"/>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u>
										</xsl:if>
										<br/>
										<br/>
										9.4.&#160;
										<!--xsl:if test="dco:DecisionClass/dco:InspectionType!='2' or not(dco:DecisionClass/dco:InspectionType)"><xsl:text>&#8211;</xsl:text></xsl:if>
										<xsl:if test="dco:DecisionClass/dco:InspectionType='2'">Акт таможенной проверки от 
											<u>
												<xsl:choose>
													<xsl:when test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u><xsl:text> №&#160;</xsl:text>
											<u>
												<xsl:choose>
													<xsl:when test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber">
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber"/>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u>
										</xsl:if-->
										<xsl:if test="not(dco:DecisionClass/dco:ActCustomsDetails)"><xsl:text>&#8211;</xsl:text></xsl:if>
										<xsl:if test="dco:DecisionClass/dco:ActCustomsDetails">Акт таможенной проверки от 
											<u>
												<xsl:choose>
													<xsl:when test="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentDate">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u><xsl:text> №&#160;</xsl:text>
											<u>
												<xsl:choose>
													<xsl:when test="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentNumber">
														<xsl:value-of select="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentNumber"/>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u>
										</xsl:if>
									</xsl:if>
									<br/>
									<br/>
									<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">9.5.</xsl:if>
									<xsl:if test="dco:DCGOType='true' or dco:DCGOType='1'">9.3.</xsl:if>
									<xsl:text>&#160;Количество дополнительных листов </xsl:text>
									<u>&#160;&#160;
									<xsl:if test="dco:AddList">
										<xsl:value-of select="dco:AddList"/>
									</xsl:if>
									<xsl:if test="not(dco:AddList)">
										0
									</xsl:if>
									&#160;&#160;</u>
									<br/>
									<br/>
									<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">9.6.</xsl:if>
									<xsl:if test="dco:DCGOType='true' or dco:DCGOType='1'">9.4.</xsl:if>
									<xsl:text>&#160;Количество приложений </xsl:text>
									<u>&#160;&#160;
									<xsl:if test="dco:ApplicationCount">
										<xsl:value-of select="dco:ApplicationCount"/>
									</xsl:if>
									<xsl:if test="not(dco:ApplicationCount)">
										0
									</xsl:if>
									&#160;&#160;</u>
									<xsl:if test="dco:DCGOType='true' or dco:DCGOType='1'">
										<br/>
										<br/>
										<xsl:text>9.5.&#160;Решение принято по результатам проверки таможенных, иных документов и (или) сведений* </xsl:text>
										<u>
											<xsl:choose>
												<!--xsl:when test="dco:DecisionClass/dco:InspectionType='1'">
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentName">
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentName"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate">
														<xsl:text>от </xsl:text>
														<xsl:call-template name="russian_date_2">
															<xsl:with-param name="dateIn" select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber">
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:when-->
												<xsl:when test="dco:DecisionClass/dco:DepartmentalControl and dco:DecisionClass/dco:InspectionDetails">
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentName">
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentName"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate">
														<xsl:text>от </xsl:text>
														<xsl:call-template name="russian_date_2">
															<xsl:with-param name="dateIn" select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber">
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</u>
										<br/>
										<br/>
										<xsl:text>9.6.&#160;Решение принято по результатам таможенной проверки* </xsl:text>
										<u>
											<xsl:choose>
												<!--xsl:when test="dco:DecisionClass/dco:InspectionType='2'">
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentName">
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentName"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate">
														<xsl:text>от </xsl:text>
														<xsl:call-template name="russian_date_2">
															<xsl:with-param name="dateIn" select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber">
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="dco:DecisionClass/dco:InspectionDetails/cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:when-->
												<xsl:when test="dco:DecisionClass/dco:CustomsControl and dco:DecisionClass/dco:ActCustomsDetails">
													<xsl:if test="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentName">
														<xsl:value-of select="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentName"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentDate">
														<xsl:text>от </xsl:text>
														<xsl:call-template name="russian_date_2">
															<xsl:with-param name="dateIn" select="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentDate"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentNumber">
														<xsl:text>№ </xsl:text>
														<xsl:value-of select="dco:DecisionClass/dco:ActCustomsDetails/cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</u>
									</xsl:if>
									<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">
										<br/>
										<br/>
										<xsl:text>9.7.&#160;</xsl:text>
										<xsl:if test="not(dco:PreviousDecision)"><xsl:text>&#8211;</xsl:text></xsl:if>
										<xsl:if test="dco:PreviousDecision"><xsl:text>Реквизиты ранее принятого решения о классификации товара</xsl:text>
											<br/>
											<xsl:text>Решение о классификации товара от </xsl:text>
											<u>
												<xsl:choose>
													<xsl:when test="dco:PreviousDecision">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="dco:PreviousDecision/dco:Date"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u><xsl:text> №&#160;</xsl:text>
											<u>
												<xsl:choose>
													<xsl:when test="dco:PreviousDecision">
														<xsl:text>РКТ-</xsl:text>
														<xsl:value-of select="dco:PreviousDecision/dco:CustomsCode"/>
														<xsl:text>-</xsl:text>
														<xsl:value-of select="substring(dco:PreviousDecision/dco:Date,3,2)"/>
														<xsl:text>/</xsl:text>
														<xsl:value-of select="dco:PreviousDecision/dco:SerialNumber"/>
														<xsl:if test="dco:PreviousDecision/dco:DocKind">
															<xsl:value-of select="dco:PreviousDecision/dco:DocKind"/>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u><xsl:text> в коде </xsl:text>
											<u>
												<xsl:choose>
													<xsl:when test="dco:PreviousDecision">
														<xsl:call-template name="TNVEDCode">
															<xsl:with-param name="str" select="dco:PreviousDecision/dco:TNVEDCode"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
												</xsl:choose>
											</u><xsl:text> ТН ВЭД ЕАЭС</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:if test="dco:DCGOType='true' or dco:DCGOType='1'">
										<br/>
										<br/>
										<xsl:text>9.7.&#160;Реквизиты ранее принятого решения о классификации товара* </xsl:text>
										<u>
											<xsl:choose>
												<xsl:when test="dco:PreviousDecision">
													<xsl:text>РКТ-</xsl:text>
													<xsl:value-of select="dco:PreviousDecision/dco:CustomsCode"/>
													<xsl:text>-</xsl:text>
													<xsl:value-of select="substring(dco:PreviousDecision/dco:Date,3,2)"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="dco:PreviousDecision/dco:SerialNumber"/>
													<xsl:if test="dco:PreviousDecision/dco:DocKind">
														<xsl:value-of select="dco:PreviousDecision/dco:DocKind"/>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>&#160;______________&#160;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</u>
									</xsl:if>
									<br/>
									<br/>
									<xsl:text>9.8.&#160;Прочие отметки</xsl:text><xsl:if test="dco:DCGOType='true' or dco:DCGOType='1'"><xsl:text>*</xsl:text></xsl:if>
									<br/>
									<xsl:if test="dco:StatData/dco:DecisionType=3">
										<xsl:if test="dco:Goods/dco:Numeric_TNVEDCode">
											номера товаров:&#160;
											<xsl:for-each select="dco:Goods/dco:Numeric_TNVEDCode">
												<xsl:if test="dco:GoodsNumeric">
													<xsl:value-of select="dco:GoodsNumeric"/>
												</xsl:if>
												<xsl:if test="dco:TNVEDCode">
													<xsl:if test="dco:GoodsNumeric">
														,&#160;
													</xsl:if>	
													<xsl:value-of select="dco:TNVEDCode"/>,&#160;
												</xsl:if>
												<xsl:if test="position()!=last()">
													;&#160;
												</xsl:if>
											</xsl:for-each>
											<br/>
										</xsl:if>
										<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">
											<xsl:if test="dco:ClassificationType='1'">
												<xsl:text>Классификация товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза осуществлена в соответствии с пунктом 3 статьи 20 Таможенного кодекса Евразийского экономического союза</xsl:text>
											</xsl:if>
										</xsl:if>
										<!--xsl:if test="dco:Goods/dco:GoodsInformation">
											описание товаров:<br/>
											<xsl:for-each select="dco:Goods/dco:GoodsInformation">
												<xsl:for-each select="*[local-name()='Manufacturer' or local-name()='TradeMark' or local-name()='GoodsMark' or local-name()='GoodsModel' or local-name()='GoodsMarking' or local-name()='GoodsStandard' or local-name()='GoodsSort' or local-name()='WoodDescriptionDetails' or local-name()='Dimensions' or local-name()='DateIssue' or local-name()='SerialNumber']">
													<xsl:if test="local-name()='Manufacturer'">
														производитель:&#160;
													</xsl:if>
													<xsl:if test="local-name()='GoodsMark'">
														марка:&#160;
													</xsl:if>
													<xsl:if test="local-name()='GoodsModel'">
														модель:&#160;
													</xsl:if>
													<xsl:if test="local-name()='GoodsSort'">
														сорт:&#160;
													</xsl:if>
													<xsl:if test="position()!=1 and local-name()!='SerialNumber'"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
													<xsl:choose>
														<xsl:when test="local-name()='WoodDescriptionDetails'">
															<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
														</xsl:when>
														<xsl:when test="local-name()='DateIssue'">
															дата выпуска:&#160;
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template> 
														</xsl:when>
														<xsl:when test="local-name()='Dimensions'">
															размеры:&#160;
															<xsl:apply-templates mode="Dimensions" select="."/>
														</xsl:when>
														<xsl:when test="local-name()='SerialNumber' and not(preceding-sibling::*[local-name()='SerialNumber'])">
															<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
															<xsl:apply-templates select="../*[local-name()='SerialNumber']"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:if test="local-name()!='SerialNumber'">
																<xsl:apply-templates select="."/>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
												<br/>
											</xsl:for-each>
										</xsl:if-->	
									</xsl:if>
									<xsl:for-each select="dco:Mark">
										<xsl:value-of select="."/>
										<!--xsl:text> </xsl:text-->
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="2">
								10. Подпись должностного лица таможенного органа                         
								<br/>
									<br/>
									<table width="100%">
										<tbody>
											<tr>
												<td align="center" width="5%"/>
												<td align="center" width="30%" class="value">
													<xsl:value-of select="dco:PersonSignature/cat_ru:PersonPost"/>
												</td>
												<td align="center" width="5%"/>
												<td align="center" width="20%" class="value"/>
												<td align="center" width="5%"/>
												<td align="center" width="30%" class="value">
													<xsl:value-of select="dco:PersonSignature/cat_ru:PersonSurname"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="dco:PersonSignature/cat_ru:PersonName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:if test="dco:PersonSignature/cat_ru:PersonMiddleName">
														<xsl:value-of select="dco:PersonSignature/cat_ru:PersonMiddleName"/>
													</xsl:if>
												</td>
												<td align="center" width="5%"/>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(должность)</xsl:text>
												</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(подпись)</xsl:text>
												</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(фамилия, имя, отчество (при наличии)</xsl:text>
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
				
				<!-- Re: ВНУТРИ: Re: Форма РКТ 21.09.2022 -->
				<!-- 
				<div class="page1">
					<h3 align="center">
					<xsl:text>Дополнительный лист № 1 решения о классификации товара от </xsl:text>
					<xsl:call-template name="russian_date_2">
						<xsl:with-param name="dateIn" select="dco:RegistrationNumber/dco:Date"/>
					</xsl:call-template>
					<xsl:text> № </xsl:text>
					<xsl:text>РКТ-</xsl:text>
					<xsl:value-of select="dco:RegistrationNumber/dco:CustomsCode"/>
					<xsl:text>-</xsl:text>
					<xsl:value-of select="substring(dco:RegistrationNumber/dco:Date,3,2)"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="dco:RegistrationNumber/dco:SerialNumber"/>
					</h3>
					<br/>
					<table width="100%">
						<tbody>
							<xsl:if test="dco:ReasonCode">
								<tr>
									<td>Код основания для принятия решения</td>
									<td class="bordered2">
										<xsl:choose>
											<xsl:when test="dco:ReasonCode=1">в порядке ведомственного контроля</xsl:when>
											<xsl:when test="dco:ReasonCode=3">в результате применения профиля риска (на основании полученного экспертного заключения)</xsl:when>
											<xsl:when test="dco:ReasonCode=4">на основании поручения вышестоящих таможенных органов</xsl:when>
											<xsl:when test="dco:ReasonCode=5">в связи с представлением декларантом после выпуска товаров документов, выданных федеральными органами исполнительной власти, либо обращением декларанта о смене кода товаров, декларированных в субпозициях TH ВЭД ЕАЭС, предназначенных для классификации товаров для промышленной сборки моторных транспортных средств товарных позиций 8701 - 8705 TH ВЭД ЕАЭС. их узлов и агрегатов</xsl:when>
											<xsl:when test="dco:ReasonCode=6">на основании дополнительно запрошенных товаросопроводительных, коммерческих, технических документов (за исключением экспертного заключения и документов федеральных органов исполнительной власти)</xsl:when>
											<xsl:when test="dco:ReasonCode=7">в результате применения профиля риска (за исключением экспертного заключения)</xsl:when>
											<xsl:when test="dco:ReasonCode=9">прочие основания (в программном средстве обеспечена возможность указания конкретного основания принятия решения по классификации товара в комментарии)</xsl:when>
											<xsl:otherwise><xsl:value-of select="dco:ReasonCode"/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="dco:DecisionClass/dco:ReasonDesc">
								<tr>
									<td>Описание основания для принятия решения</td>
									<td class="bordered2">
										<xsl:value-of select="dco:DecisionClass/dco:ReasonDesc"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="dco:Goods/dco:DTList">
								<xsl:if test="dco:ProcedureID">
									<tr>
										<td>
											<xsl:text>Идентификатор процедуры декларирования для ДТ&#160;</xsl:text>
											<xsl:apply-templates select="dco:RecNum"/>
										</td>
										<td class="bordered2">
											<xsl:value-of select="dco:ProcedureID"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<tr>
								<td colspan="2"><div class="marg-top2">Подробное описание товара</div></td>
							</tr>
							<xsl:for-each select="dco:Goods">
								<tr>
									<td>Наименование товара</td>
									<td class="bordered2">
										<xsl:for-each select="dco:GoodDescription"><xsl:value-of select="."/></xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>Признак принятия решения в отношении части товара</td>
									<td class="bordered2">
										<xsl:choose>
											<xsl:when test="dco:IsPartialGood=1 or dco:IsPartialGood='true'">да</xsl:when>
											<xsl:otherwise>нет</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td>Признак принадлежности к товарам списка</td>
									<td class="bordered2">
										<xsl:choose>
											<xsl:when test="dco:GoodsClassificationCode=1 or dco:GoodsClassificationCode='true'">да</xsl:when>
											<xsl:when test="dco:GoodsClassificationCode=0 or dco:GoodsClassificationCode='false'">нет</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<xsl:if test="dco:GoodsInformation">
									<tr>
										<td colspan="2"><br/>Характеристика товара</td>
									</tr>
									<tr>
										<td colspan="2">
											<table class="border" width="100%" style="border-collapse:collapse;">
												<tr align="center">
													<td class="graphMain bordered">№ п/п записи в группе</td>
													<td class="border">Сведения о производителе</td>
													<td class="border">Тов. знак, место происхождения, объект авторского права, смежных прав, патент и т.д.</td>
													<td class="border">Марка товара</td>
													<td class="border">Модель товара</td>
													<td class="border">Артикул товара</td>
													<td class="border">Стандарт (ГОСТ, ОСТ, СПП, СТО, ТУ)</td>
													<td class="border">Сорт / Сорт или группа сортов (для лесо- и пиломатериалов)</td>
													<td class="border">Сведения о лесоматериалах</td>
													<td class="border">Размеры</td>
													<td class="border">Дата выпуска</td>
													<td class="border">Серийный номер</td>
													<td class="border">Количество товаров. Гр.31 первый подраздел</td>
													<td class="border">Цена/стоимость товарной позиции</td>
													<td class="border">Разрешительный документ</td>
												</tr>
												<xsl:apply-templates select="dco:GoodsInformation"/>
											</table>	
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="dco:DTList/dco:Numeric_TNVEDCode">
									<tr>
										<td colspan="2"><br/>Сведения о номере товара по ДТ и заявленном коде товара по ТН ВЭД ЕАЭС</td>
									</tr>
									<tr>
										<td colspan="2">
											<table class="border" width="100%" style="border-collapse:collapse;">
												<tr align="center">
													<td class="border">Номер по порядку</td>
													<td class="border">Номер товара по ДТ</td>
													<td class="border">Код товара по ТН ВЭД ЕАЭС, заявленный в ДТ</td>
													<td class="border">Наименование товара</td>
												</tr>
												<xsl:for-each select="dco:DTList">
													<xsl:for-each select="dco:Numeric_TNVEDCode">
														<tr align="center">
															<td class="border"><xsl:value-of select="dco:ListNumeric"/></td>
															<td class="border"><xsl:value-of select="dco:GoodsNumeric"/></td>
															<td class="border"><xsl:value-of select="dco:TNVEDCode"/></td>
															<td class="border"><xsl:apply-templates select="dco:GoodDescription"/></td>
														</tr>
													</xsl:for-each>
												</xsl:for-each>
											</table>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
				-->
				<xsl:for-each select="dco:Application">
					<div class="page1">
						<h3 align="center">
						<xsl:text>Дополнительный лист № </xsl:text>
						<xsl:value-of select="dco:ApplicationNum"/>
						<xsl:text> решения о классификации товара от </xsl:text>
						<xsl:call-template name="russian_date_2">
							<xsl:with-param name="dateIn" select="../dco:RegistrationNumber/dco:Date"/>
						</xsl:call-template>
						<xsl:text> № </xsl:text>
						<xsl:text>РКТ-</xsl:text>
						<xsl:value-of select="../dco:RegistrationNumber/dco:CustomsCode"/>
						<xsl:text>-</xsl:text>
						<xsl:value-of select="substring(../dco:RegistrationNumber/dco:Date,3,2)"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="../dco:RegistrationNumber/dco:SerialNumber"/>
						</h3>
						<br/>
						<div align="left">
							<xsl:apply-templates select="dco:ApplicationText"/>
						</div>
						<br/>
						<br/>
						<div align="left">
							<xsl:text>Уполномоченное должностное лицо, принявшее решение о классификации товара:</xsl:text>
						</div>
						<div class="content">
							<table class="person" border="1" style="border:0; margin-top:20px;" width="100%">
								<tbody>
									<tr>
										<!--<xsl:if test="../dco:PersonSignature/cat_ru:PersonPost">-->
										<td align="center" style="border:0px">
											<xsl:value-of select="../dco:PersonSignature/cat_ru:PersonPost"/>
										</td>
										<td style="border:0px; width:40px"/>
										<!--</xsl:if>-->
										<td align="center" style="border:0px" width="40px"/>
										<td style="border:0px; width:40px"/>
										<td align="center" style="border:0px;">
											<xsl:value-of select="../dco:PersonSignature/cat_ru:PersonSurname"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:value-of select="../dco:PersonSignature/cat_ru:PersonName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="../dco:PersonSignature/cat_ru:PersonMiddleName">
												<xsl:value-of select="../dco:PersonSignature/cat_ru:PersonMiddleName"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<!--<xsl:if test="../dco:PersonSignature/cat_ru:PersonPost">-->
										<td class="spec_column" style="min-width: 40px" align="center">(должность)</td>
										<td style="border:0px;"/>
										<!--</xsl:if>-->
										<!--xsl:if test="../dco:PersonSignature/cat_ru:IssueDate"-->
											<td class="spec_column" style="min-width: 40px" align="center">(подпись)</td>
											<td style="border:0px;"/>
										<!--/xsl:if-->
										<td class="spec_column" align="center">(фамилия, имя, отчество (при наличии))</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</xsl:for-each>
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
	<xsl:template name="russian_date_2">
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
	<xsl:template name="TNVEDCode">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="string-length($str)=10">
				<xsl:value-of select="substring($str, 1, 4)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 5, 2)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 7, 3)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 10, 1)"/>
			</xsl:when>
			<xsl:when test="string-length($str)=7 or string-length($str)=8 or string-length($str)=9">
				<xsl:value-of select="substring($str, 1, 4)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 5, 2)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 7, 3)"/>
			</xsl:when>
			<xsl:when test="string-length($str)=5 or string-length($str)=6">
				<xsl:value-of select="substring($str, 1, 4)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 5, 2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$str"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="ddmmyy">
		<xsl:param name="reg"/>
		<xsl:choose>
			<xsl:when test="substring($reg,5,1)='-' ">
				<xsl:value-of select="substring($reg,9,2)"/>
				<xsl:value-of select="substring($reg,6,2)"/>
				<xsl:value-of select="substring($reg,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$reg"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:value-of select="substring (., 9, 2)"/>&#160;
		<xsl:variable name="month" select="substring(., 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=01">января</xsl:when>
			<xsl:when test="$month=02">февраля</xsl:when>
			<xsl:when test="$month=03">марта</xsl:when>
			<xsl:when test="$month=04">апреля</xsl:when>
			<xsl:when test="$month=05">мая</xsl:when>
			<xsl:when test="$month=06">июня</xsl:when>
			<xsl:when test="$month=07">июля</xsl:when>
			<xsl:when test="$month=08">августа</xsl:when>
			<xsl:when test="$month=09">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose>&#160;					
		<xsl:value-of select="substring(., 1, 4)"/>&#160;г.
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">, &#160;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">,&#160;Код страны: &#160;<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">,&#160;ОПФ: &#160;<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<xsl:text>,&#160;УИФЛ: &#160; </xsl:text>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">, &#160;<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="IdentityCardStr"/>
		</xsl:if>
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">, &#160;<xsl:apply-templates mode="AdressStr" select="."/>
		</xsl:for-each>
		<xsl:if test="dco:DCGOType='false' or dco:DCGOType='0'">
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<span class="normal">
					<xsl:for-each select="RUScat_ru:CommunicationDetails">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</span>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text> код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> (код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:text>, &#160;УИТН: &#160;</xsl:text>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="AdressStr" match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>Код вида адреса:  <xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:text> &#160;</xsl:text>
				<xsl:value-of select="RUScat_ru:AddressText"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
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
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="IdentityCardStr" match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
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
	<xsl:template match="dco:GoodsInformation">
		<tr valign="top">
			<td class="border">
				<xsl:value-of select="catESAD_cu:LineNum"/>
			</td>
			<td class="border">
				<xsl:value-of select="catESAD_cu:Manufacturer"/>
				<xsl:if test="catESAD_cu:ManufacturerINN">
					<xsl:text> ИНН </xsl:text>
					<xsl:value-of select="catESAD_cu:ManufacturerINN"/>
				</xsl:if>
				<xsl:if test="catESAD_cu:ManufacturerOKATO">
					<xsl:text> ОКАТО </xsl:text>
					<xsl:value-of select="catESAD_cu:ManufacturerOKATO"/>
				</xsl:if>
				<xsl:if test="catESAD_cu:ProductionPlaceName and catESAD_cu:Manufacturer">
					<xsl:text>; </xsl:text>
				</xsl:if>
				<xsl:if test="catESAD_cu:ProductionPlaceName">
					<xsl:text>место происхождения: </xsl:text>
					<xsl:value-of select="catESAD_cu:ProductionPlaceName"/>
				</xsl:if>
			</td>
			<td class="border">
				<xsl:value-of select="catESAD_cu:TradeMark"/>
			</td>
			<td class="border">
				<xsl:value-of select="catESAD_cu:GoodsMark"/>
			</td>
			<td class="border">
				<xsl:value-of select="catESAD_cu:GoodsModel"/>
			</td>
			<td class="border">
				<xsl:value-of select="catESAD_cu:GoodsMarking"/>
			</td>
			<td class="border">
				<xsl:value-of select="catESAD_cu:GoodsStandard"/>
			</td>
			<td class="border">
				<xsl:value-of select="catESAD_cu:GoodsSort"/>
			</td>
			<td class="border">
				<xsl:apply-templates mode="WoodDescriptionDetails" select="catESAD_cu:WoodDescriptionDetails"/>
			</td>
			<td class="border">
				<xsl:apply-templates mode="Dimensions" select="catESAD_cu:Dimensions"/>
			</td>
			<td class="border">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
				</xsl:call-template>
			</td>
			<td class="border">
				<xsl:for-each select="catESAD_cu:SerialNumber">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()"> </xsl:if>
				</xsl:for-each>
			</td>
			<td class="border">
				<xsl:if test="catESAD_cu:GoodsGroupQuantity">
					<xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/>
				</xsl:if>
			</td>
			<td class="border">
				<xsl:if test="catESAD_cu:InvoicedCost">
					<xsl:value-of select="translate(translate(format-number(catESAD_cu:InvoicedCost, '#,###.00'),',',' '),'.',',')"/>
				</xsl:if>
			</td>
			<td class="border">
				<xsl:for-each select="catESAD_cu:LicenseGroup/catESAD_cu:LicDocument">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">; </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
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
	<xsl:template match="catESAD_cu:GoodsGroupQuantity">
		<xsl:value-of select="translate(catESAD_cu:GoodsQuantity, '.', ',')"/>
		<xsl:if test="catESAD_cu:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="catESAD_cu:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="catESAD_cu:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='WoodSortiment'">
				<xsl:text>Наим. сортимента: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='WoodKind'">
				<xsl:text>Порода древесины: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='ProductSortName'">
				<xsl:text>Наименование сорта: </xsl:text>
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
	<xsl:template mode="gtd_num" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
