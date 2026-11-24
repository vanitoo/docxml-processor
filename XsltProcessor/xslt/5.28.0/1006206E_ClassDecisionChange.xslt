<?xml version="1.0" encoding="UTF-8"?>
<!--Проект приказа ФТС России "Об утверждении формы решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза, формы решения об изменении решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза, порядков их заполнения, а также порядков и сроков принятия указанных решений" 
Приложение №4 (DCGType=0) 
Приказ ФТС России от 31.01.2019 №156 "Об утверждении формы решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза, формы решения об изменении решения о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза, порядков их заполнения, а также порядков и сроков принятия указанных решений" 
Приложение №4 (DCGType=1)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cdc="urn:customs.ru:Information:CustomsDocuments:ClassDecisionChange:5.24.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cdc:ClassDecisionChange">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Решение об изменении решения по классификации товара</title>
				<style type="text/css">
					body
					{background: #cccccc;}

					div.page
					{width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;}

					div.album_page
					{width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					h2
					{text-align:center;
					font: 20;
					font-family: Arial, serif;}

					.remark
					{text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;}

					.header
					{font-weight: bold;
					margin-top:20px;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					td
					{border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;}

					.spec_column
					{border-bottom: 0px; 
					border-left: 0px; 
					border-right: 0px; 
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;}

					.annot
					{border: 0;}

					.low
					{font: 12;
					font-fase: Courier;}

					.graph
					{font-family: Arial;
					font-size: 11pt;}

					.graph2
					{font-family: Arial;
					font-size: 10pt;}

					jh
					{font: 16;
					font-face: Arial;}

					dog1
					{position:relative;
					left: 50px;
					bottom: 50px;}

					.gra
					{font-family: Arial;
					font-size: 6pt;}

					.g
					{border-right:0pt solid;}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td align="center" class="graph" style="border:solid 0pt">
								<xsl:if test="cdc:DCGOType='false' or cdc:DCGOType='0'">
									<font face="Times new roman" size="5">
											<xsl:text>МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
									</font>
									<br/>
									<br/>
								</xsl:if>
								<font face="Times new roman" size="4">
									<b>
										<xsl:text>РЕШЕНИЕ ОБ ИЗМЕНЕНИИ РЕШЕНИЯ О КЛАССИФИКАЦИИ ТОВАРА В СООТВЕТСТВИИ С ЕДИНОЙ </xsl:text>
										<xsl:text>ТОВАРНОЙ НОМЕНКЛАТУРОЙ ВНЕШНЕЭКОНОМИЧЕСКОЙ ДЕЯТЕЛЬНОСТИ ЕВРАЗИЙСКОГО ЭКОНОМИЧЕСКОГО СОЮЗА</xsl:text>
									</b>
								</font>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt"> </td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="graph" style="border:solid 1pt #000000" width="50%">1. Наименование таможенного органа, принявшего решение об изменении решения о классификации товара<br/>
								<span class="graph2">
									<xsl:value-of select="cdc:Customs/*[local-name() = 'Code']"/>
									<xsl:if test="cdc:Customs/*[local-name() = 'OfficeName']"> <xsl:value-of select="cdc:Customs/*[local-name() = 'OfficeName']"/>
									</xsl:if>
								</span>
							</td>
							<xsl:if test="cdc:DCGOType='false' or cdc:DCGOType='0'">
								<td class="graph" style="border:solid 1pt #000000" width="50%">2. Полное наименование либо Ф.И.О. (отчество при наличии) декларанта<br/>
									<span class="graph2">
										<xsl:apply-templates mode="Declarant0" select="cdc:Declarant"/>
										<br/>
										<xsl:if test="cdc:Declarant/cdc:SeparateDivision">
											<br/>
											Обособленное подразделение:
											<br/>
											<xsl:apply-templates mode="Declarant0" select="cdc:Declarant/cdc:SeparateDivision"/>
										</xsl:if>
										<xsl:if test="cdc:Declarant/RUScat_ru:IdentityCard">
											<br/>
											<xsl:apply-templates select="cdc:Declarant/RUScat_ru:IdentityCard"/>
										</xsl:if>
									</span>
								</td>
							</xsl:if>
							<xsl:if test="cdc:DCGOType='true' or cdc:DCGOType='1'">
								<td class="graph" style="border:solid 1pt #000000" width="50%">2. Сведения о декларанте<br/>
									<span class="graph2">
										<xsl:apply-templates mode="Declarant1" select="cdc:Declarant"/>
										<br/>
										<xsl:if test="cdc:Declarant/RUScat_ru:IdentityCard">
											<br/>
											<xsl:apply-templates select="cdc:Declarant/RUScat_ru:IdentityCard"/>
										</xsl:if>
									</span>
								</td>
							</xsl:if>
						</tr>
						<tr>
							<td class="graph" style="border:solid 1pt #000000" width="50%">3. Регистрационный номер<br/>
								<span class="graph2">
									<xsl:apply-templates select="cdc:RegistrationNumber"/>
								</span>
							</td>
							<td class="graph" style="border:solid 1pt #000000" width="50%">4. Дата принятия решения об изменении решения о классификации товара<br/>
								<span class="graph2">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cdc:Date"/>
									</xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 1pt #000000">5. Наименование товара<br/>
								<span class="graph2">
									<xsl:for-each select="cdc:RegNumberDT">
										<xsl:if test="position()!=1">
											<br/>
										</xsl:if>
										<xsl:apply-templates select="cdc:GoodsNumeric"/>
										<xsl:text>: </xsl:text>
										<xsl:for-each select="cdc:Goods">
											<xsl:text>№ п/п </xsl:text>
											<xsl:value-of select="cdc:ListNumeric"/>
											<xsl:text>, № товара по ДТ </xsl:text>
											<xsl:value-of select="cdc:GoodsNumeric"/>
											<xsl:if test="cdc:GoodDescription">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="cdc:GoodDescription"/>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 1pt #000000">6. 
								<xsl:text>В решении о классификации товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза №&#160;</xsl:text>
								<!-- добавить номер решения -->
								<u>&#160;&#160;
								<span class="graph2">
 									<xsl:apply-templates select="cdc:RegNumDecisionClassGood"/>
								</span>
								&#160;&#160;</u>
								<xsl:text> от&#160;</xsl:text>
									<u>&#160;&#160;
									<span class="graph2">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cdc:RegNumDecisionClassGood/cdc:Date"/>
										</xsl:call-template> 
									</span>
								&#160;&#160;</u>
								<xsl:text> вносятся следующие изменения:</xsl:text>
								<br/>
								<xsl:if test="cdc:DCGOType='false' or cdc:DCGOType='0'">
									<xsl:for-each select="cdc:RegNumberDT/cdc:Goods/cdc:ChangesDescription">
										<span class="graph2">
											<xsl:text>В пункте </xsl:text>
											<xsl:if test="cdc:DCGOType='true' or cdc:DCGOType='1'">
												<xsl:text>В графе </xsl:text>
											</xsl:if>
											<u>
												<xsl:value-of select="cdc:GRNumber"/>
											</u>
											<xsl:text> решения о классификации товара вместо </xsl:text>
											<u>
												<xsl:value-of select="cdc:PreviousValue"/>
											</u>
											<xsl:text> следует читать </xsl:text>
											<u>
												<xsl:value-of select="cdc:NewValue"/>
											</u>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</span>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cdc:DCGOType='true' or cdc:DCGOType='1'">
									<xsl:for-each select="cdc:RegNumberDT/cdc:Goods/cdc:ChangesDescription">
										<span class="graph2">
											<xsl:text>В графе </xsl:text>
											<u>
												<xsl:value-of select="cdc:GRNumber"/>
											</u>
											<xsl:text> решения о классификации товара вместо </xsl:text>
											<u>
												<xsl:value-of select="cdc:PreviousValue"/>
											</u>
											<xsl:text> следует читать </xsl:text>
											<u>
												<xsl:value-of select="cdc:NewValue"/>
											</u>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</span>
									</xsl:for-each>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="2" style="border:solid 1pt #000000">7. Подпись должностного лица таможенного органа<br/> <br/>
								<table>
									<tr>
										<td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="30%">
											<xsl:if test="cdc:CustomsPerson/cat_ru:PersonPost">
												<xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonPost"/>
											</xsl:if>
										</td>
										<td class="graph2" style="border:solid 0pt" width="10%"> </td>
										<td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="20%"> </td>
										<td class="graph2" style="border:solid 0pt" width="10%"> </td>
										<td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="30%">
											<xsl:if test="cdc:DCGOType='false' or cdc:DCGOType='0'">
												<xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonSurname"/>&#160;
												<xsl:value-of select="substring(cdc:CustomsPerson/cat_ru:PersonName,1,1)"/>
												<xsl:if test="cdc:CustomsPerson/cat_ru:PersonName">.</xsl:if>
												<xsl:value-of select="substring(cdc:CustomsPerson/cat_ru:PersonMiddleName,1,1)"/>
												<xsl:if test="cdc:CustomsPerson/cat_ru:PersonMiddleName">.</xsl:if>
											</xsl:if>
											<xsl:if test="cdc:DCGOType='true' or cdc:DCGOType='1'">
												<xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonSurname"/> 
												<xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonName"/>
												<xsl:if test="cdc:CustomsPerson/cat_ru:PersonMiddleName">
													<xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonMiddleName"/>
												</xsl:if>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph2" style="border:solid 0pt" width="30%">(должность)</td>
										<td class="graph2" style="border:solid 0pt" width="10%"> </td>
										<td align="center" class="graph2" style="border:solid 0pt" width="20%">(подпись)</td>
										<td class="graph2" style="border:solid 0pt" width="10%"> </td>
										<td align="center" class="graph2" style="border:solid 0pt" width="30%">
											<xsl:if test="cdc:DCGOType='false' or cdc:DCGOType='0'">
												(фамилия, инициалы (отчество указывается при наличии))
											</xsl:if>
											<xsl:if test="cdc:DCGOType='true' or cdc:DCGOType='1'">
												(фамилия, имя, отчество (при наличии))
											</xsl:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<xsl:for-each select="cdc:Application">
					<div class="page">
						<h3 align="center">
						<xsl:text>Дополнительный лист № </xsl:text>
						<xsl:value-of select="cdc:ApplicationNum"/>
						<xsl:text> решения об изменении решения о классификации товара от </xsl:text>
						<xsl:call-template name="russian_date_2">
							<xsl:with-param name="dateIn" select="../cdc:RegistrationNumber/cdc:Date"/>
						</xsl:call-template>
						<xsl:text> № </xsl:text>
						<xsl:text>РКТ-</xsl:text>
						<xsl:value-of select="../cdc:RegistrationNumber/cdc:CustomsCode"/>
						<xsl:text>-</xsl:text>
						<xsl:value-of select="substring(../cdc:RegistrationNumber/cdc:Date,3,2)"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="../cdc:RegistrationNumber/cdc:SerialNumber"/>
						</h3>
						<br/>
						<div align="left">
							<xsl:apply-templates select="cdc:ApplicationText"/>
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
										<!--<xsl:if test="../cdc:CustomsPerson/cat_ru:PersonPost">-->
										<td align="center" style="border:0px">
											<xsl:value-of select="../cdc:CustomsPerson/cat_ru:PersonPost"/>
										</td>
										<td style="border:0px; width:40px"/>
										<!--</xsl:if>-->
										<td align="center" style="border:0px" width="40px"/>
										<td style="border:0px; width:40px"/>
										<td align="center" style="border:0px;">
											<xsl:value-of select="../cdc:CustomsPerson/cat_ru:PersonSurname"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:value-of select="../cdc:CustomsPerson/cat_ru:PersonName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="../cdc:CustomsPerson/cat_ru:PersonMiddleName">
												<xsl:value-of select="../cdc:CustomsPerson/cat_ru:PersonMiddleName"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<!--<xsl:if test="../cdc:CustomsPerson/cat_ru:PersonPost">-->
										<td class="spec_column" style="min-width: 40px" align="center">(должность)</td>
										<td style="border:0px;"/>
										<!--</xsl:if>-->
										<!--xsl:if test="../cdc:CustomsPerson/cat_ru:IssueDate"-->
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
				<xsl:if test="cdc:RegNumberDT/cdc:ProcedureID">
					<div class="page">
						<table>
							<tr>
								<td align="center" class="graph" style="border:solid 0pt">
									<font face="Times new roman" size="4">
										<b>ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</b>
									</font>
								</td>
							</tr>
						</table>
						<br/>
						<table>
							<xsl:for-each select="cdc:RegNumberDT">
								<xsl:if test="cdc:ProcedureID">
									<tr>
										<td class="graph2" style="width: 50%; vertical-align: middle">
											<xsl:text>Идентификатор процедуры декларирования для ДТ&#160;</xsl:text>
											<xsl:apply-templates select="cdc:GoodsNumeric"/>
										</td>
										<td class="graph2" style="width: 50%">
											<xsl:value-of select="cdc:ProcedureID"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
						<br/>
						<xsl:if test="cdc:DCGOType='false' or cdc:DCGOType='0'">
							<table>
								<tr>
									<td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="30%">
										<xsl:if test="cdc:CustomsPerson/cat_ru:PersonPost">
											<xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonPost"/>
										</xsl:if>
									</td>
									<td class="graph2" style="border:solid 0pt" width="10%"> </td>
									<td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="20%"> </td>
									<td class="graph2" style="border:solid 0pt" width="10%"> </td>
									<td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="30%">
										<xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="substring(cdc:CustomsPerson/cat_ru:PersonName,1,1)"/>
										<xsl:if test="cdc:CustomsPerson/cat_ru:PersonName">.</xsl:if>
										<xsl:value-of select="substring(cdc:CustomsPerson/cat_ru:PersonMiddleName,1,1)"/>
										<xsl:if test="cdc:CustomsPerson/cat_ru:PersonMiddleName">.</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="center" class="graph2" style="border:solid 0pt" width="30%">(должность)</td>
									<td class="graph2" style="border:solid 0pt" width="10%"> </td>
									<td align="center" class="graph2" style="border:solid 0pt" width="20%">(подпись)</td>
									<td class="graph2" style="border:solid 0pt" width="10%"> </td>
									<td align="center" class="graph2" style="border:solid 0pt" width="30%">
										(фамилия, инициалы (отчество указывается при наличии))
									</td>
								</tr>
							</table>
						</xsl:if>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cdc:RegistrationNumber | cdc:RegNumDecisionClassGood">
		<xsl:text>РКТ-</xsl:text>
		<xsl:value-of select="cdc:CustomsCode"/>
		<xsl:text>-</xsl:text>
		<xsl:call-template name="year_date">
			<xsl:with-param name="dateIn" select="cdc:Date"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cdc:SerialNumber"/>
		<xsl:value-of select="cdc:DocKind"/>
	</xsl:template>
	<xsl:template mode="Declarant0" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if> 
      <xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures/cat_ru:INN and cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<br/>
				<xsl:text>ИНН/КПП </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:when>
			<xsl:when test="cat_ru:RFOrganizationFeatures/cat_ru:INN and not(cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
				<br/>
				<xsl:text>ИНН </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</xsl:when>
			<xsl:when test="not(cat_ru:RFOrganizationFeatures/cat_ru:INN) and cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<br/>
				<xsl:text>КПП </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<br/>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
				<br/>
				<xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="Declarant1" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if> 
      <xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures/cat_ru:INN and cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<br/>
				<xsl:text>ИНН/КПП </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:when>
			<xsl:when test="cat_ru:RFOrganizationFeatures/cat_ru:INN and not(cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
				<br/>
				<xsl:text>ИНН </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</xsl:when>
			<xsl:when test="not(cat_ru:RFOrganizationFeatures/cat_ru:INN) and cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<br/>
				<xsl:text>КПП </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<br/>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span> 
	</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKincdcde">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKincdcde='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKincdcde='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKincdcde='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKincdcde"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
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
						<xsl:when test="local-name()='AddressKincdcde'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
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
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
	Документ, удостоверяющий личность: 
	<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCarcdcde"> (код вида документа <xsl:value-of select="RUScat_ru:IdentityCarcdcde"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCarcdcde">
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
			Серия номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cdc:GoodsNumeric">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
	<xsl:template name="year_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
