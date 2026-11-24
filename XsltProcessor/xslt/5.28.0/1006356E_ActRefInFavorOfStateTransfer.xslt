<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:act_rifos="urn:customs.ru:Information:CustomsDocuments:ActRefInFavorOfStateTransfer:5.24.0">
	<!-- Шаблон для типа ActRefInFavorOfStateTransferType -->
	<xsl:template match="act_rifos:ActRefInFavorOfStateTransfer">
		<xsl:param name="w" select="180"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div
					{white-space: normal;}

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
					font-style: Italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;
					font-family: Arial;
					font-size: 8pt;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.indent
					{text-indent: 1.5em;}

					.underlined
					{border-bottom: 1px solid windowtext;}

					.delim_3
					{height: 3pt;}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="3">
										<b>Акт приема-передачи<br/>товаров, помещенных под таможенную процедуру<br/>отказа в пользу государства</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody style="font-size: 10pt">
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>1. Дата составления: </xsl:text></b>
									<u>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="act_rifos:CompilationDate"/>
										</xsl:call-template>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>2. Место составления: </xsl:text></b>
									<u>
										<xsl:apply-templates select="act_rifos:CompilationPlace"/>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>3. Наименование лица, помещающего товары под таможенную процедуру отказа
в пользу государства: </xsl:text></b>
									<u>
										<xsl:value-of select="act_rifos:Declarant/cat_ru:OrganizationName"/>
										<xsl:if test="act_rifos:Declarant/cat_ru:ShortName">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="act_rifos:Declarant/cat_ru:ShortName"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>4. Наименование таможенного органа: </xsl:text></b>
									<u>
										<xsl:if test="act_rifos:Customs/cat_ru:OfficeName">
											<xsl:value-of select="act_rifos:Customs/cat_ru:OfficeName"/>
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="act_rifos:Customs/cat_ru:Code"/>
										<xsl:if test="act_rifos:Customs/cat_ru:OfficeName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>5. Сведения об иностранных товарах: </xsl:text></b>
									<br/>
									<table class="bordered" align="center" border="1" style="border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext;border-bottom: .5pt solid windowtext;width: 180mm;">
										<tbody>
											<tr style="text-align:center;">
												<td><xsl:text>№ п/п</xsl:text></td>
												<td><xsl:text>Полное наименование каждого вида или группы однородных равноценных видов товаров (с описанием и указанием их идентификационных и иных отличительных признаков, состояния упаковки, внешнего вида, сроков годности, комплектности)</xsl:text></td>
												<td><xsl:text>Код единой Товарной номенклатуры внешнеэкономической деятельности Евразийского экономического союза</xsl:text></td>
												<td><xsl:text>Количество /основная единица измерения</xsl:text></td>
												<td><xsl:text>Количество /дополнительная единица измерения (при наличии)</xsl:text></td>
												<td><xsl:text>Общая таможенная стоимость товаров, руб.</xsl:text></td>
												<td><xsl:text>Таможенная стоимость за единицу товара, руб.</xsl:text></td>
												<td><xsl:text>Примечания</xsl:text></td>
											</tr>
											<tr style="text-align:center;">
												<td><xsl:text>1</xsl:text></td>
												<td><xsl:text>2</xsl:text></td>
												<td><xsl:text>3</xsl:text></td>
												<td><xsl:text>4</xsl:text></td>
												<td><xsl:text>5</xsl:text></td>
												<td><xsl:text>6</xsl:text></td>
												<td><xsl:text>7</xsl:text></td>
												<td><xsl:text>8</xsl:text></td>
											</tr>
											<xsl:for-each select="act_rifos:RIFOSGood">
												<xsl:sort data-type="number" order="ascending" select="act_rifos:GoodsNumeric"/>
												<tr style="text-align:center;">
													<td>
														<xsl:value-of select="act_rifos:GoodsNumeric"/>
													</td>
													<td>
														<xsl:apply-templates select="act_rifos:GoodDescription"/>
													</td>
													<td>
														<xsl:value-of select="act_rifos:GoodTNVEDCode"/>
													</td>
													<td>
														<xsl:value-of select="act_rifos:GoodQuantity/cat_ru:GoodsQuantity"/>
														<xsl:if test="act_rifos:GoodQuantity/cat_ru:MeasureUnitQualifierName">
															<xsl:text> </xsl:text>
															<xsl:value-of select="act_rifos:GoodQuantity/cat_ru:MeasureUnitQualifierName"/>
														</xsl:if>
														<xsl:if test="act_rifos:GoodQuantity/cat_ru:MeasureUnitQualifierCode">
															<xsl:text> (</xsl:text>
															<xsl:value-of select="act_rifos:GoodQuantity/cat_ru:MeasureUnitQualifierCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
													</td>
													<td>
														<xsl:value-of select="act_rifos:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
														<xsl:if test="act_rifos:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
															<xsl:text> </xsl:text>
															<xsl:value-of select="act_rifos:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
														</xsl:if>
														<xsl:if test="act_rifos:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
															<xsl:text> (</xsl:text>
															<xsl:value-of select="act_rifos:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
													</td>
													<td>
														<xsl:value-of select="act_rifos:TotalCost"/>
													</td>
													<td>
														<xsl:value-of select="act_rifos:GoodCost"/>
													</td>
													<td>
														<xsl:apply-templates select="act_rifos:Note"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>6. Фамилия, имя, отчество лица, подписавшего акт от декларанта: </xsl:text></b>
									<u>
										<xsl:if test="act_rifos:DeclarantSign/cat_ru:PersonPost">
											<xsl:value-of select="act_rifos:DeclarantSign/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="act_rifos:DeclarantSign/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="act_rifos:DeclarantSign/cat_ru:PersonName"/>
										<xsl:if test="act_rifos:DeclarantSign/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="act_rifos:DeclarantSign/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>7. Фамилия, имя, отчество лица, подписавшего акт от таможенного органа: </xsl:text></b>
									<u>
										<xsl:if test="act_rifos:CustomSign/cat_ru:PersonPost">
											<xsl:value-of select="act_rifos:CustomSign/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="act_rifos:CustomSign/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="act_rifos:CustomSign/cat_ru:PersonName"/>
										<xsl:if test="act_rifos:CustomSign/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="act_rifos:CustomSign/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</u>
									<xsl:text>.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="act_rifos:CompilationPlace">
		<xsl:for-each select="*">
			<xsl:if test="local-name()='PostalCode'">Почтовый индекс: </xsl:if>
			<xsl:if test="local-name()='TerritoryCode'">Код административно - территориальной единицы: </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='CountryCode'">
					<xsl:if test="not(../cat_ru:CounryName)">
						<xsl:value-of select="."/>
					</xsl:if>	
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<xsl:if test="local-name()='CounryName'">
						<xsl:if test="../cat_ru:CountryCode"> (<xsl:value-of select="../cat_ru:CountryCode"/>)</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and ((local-name()!='CountryCode') or (local-name()='CountryCode' and not(../cat_ru:CounryName)))">, </xsl:if>
		</xsl:for-each>
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
</xsl:stylesheet>
