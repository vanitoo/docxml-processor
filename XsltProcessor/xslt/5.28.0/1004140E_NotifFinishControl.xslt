<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:nfc="urn:customs.ru:Information:ExchangeDocuments:NotifFinishControl:5.26.0">
<!-- Письмо УКТР от 11.09.2018 № 24-56/57584-->
	<!-- Шаблон для типа NotifFinishControlType -->
	<xsl:template match="nfc:NotifFinishControl">
		<html>
			<head>
				<style>
			body {
			background: #cccccc;
			}

			div.page {
			width: 180mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
            table-layout: fixed;			
			word-wrap: break-word;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
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

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td>УВЕДОМЛЕНИЕ</td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr align="center">
								<td><b>О ЗАВЕРШЕНИИ ТАМОЖЕННОГО КОНТРОЛЯ<!--br/>ТАМОЖЕННОЙ СТОИМОСТИ--></b></td>
							</tr>
							<tr class="delim_3">
								<td> </td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>от </xsl:text>
									<xsl:apply-templates mode="DateStr" select="nfc:ResolDate"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="45%" class="border_bottom">
									<xsl:apply-templates select="nfc:OfficeName"/>
								</td>
								<td width="10%"> </td>
								<td width="45%" class="border_bottom">
									<xsl:apply-templates select="nfc:DeclName"/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td>
									<xsl:text>(Наименование таможенного органа)</xsl:text>
								</td>
								<td> </td>
								<td>
									<xsl:text>(Наименование декларанта или таможенного представителя)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim">
								<td> </td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<!--xsl:text>&#160;&#160;&#160;&#160;&#160;В соответствии с пунктом 19 статьи 325 Таможенного кодекса Евразийского экономического союза информируем о завершении </xsl:text>
									<xsl:text>проверки таможенных и иных документов и (или) сведений, представленных в подтверждение заявленных сведений о таможенной стоимости товаров, </xsl:text>
									<xsl:text>заявленных в декларации на товары </xsl:text-->
									<xsl:text>&#160;&#160;&#160;&#160;&#160;В соответствии с статьей 325 Таможенного кодекса Евразийского экономического союза информируем о завершении проверки </xsl:text>
									<xsl:text>таможенных и иных документов и (или) сведений, </xsl:text><!--представленных в подтверждение заявленных сведений о таможенной стоимости товаров, -->
									<xsl:text>заявленных в декларации на товары </xsl:text>
									<u><xsl:text>№&#160;</xsl:text>
									<xsl:apply-templates select="nfc:GTDID"/></u>
									<xsl:text>, по направлению </xsl:text>
									<!--xsl:for-each select="nfc:CustomsInf/nfc:DocSign">
										<xsl:if test="position() != 1">, </xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each-->
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 1">таможенная стоимость товаров</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 2"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1">, </xsl:if>классификация товара в соответствии с ТН ВЭД ЕАЭС</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 3"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2">, </xsl:if>происхождение товаров и (или) тарифных преференциях</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 4"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3">, </xsl:if>соблюдение мер технического регулирования</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 5"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4">, </xsl:if>соблюдение санитарных мер</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 6"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5">, </xsl:if>соблюдение ветеринарно-санитарных мер</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 7"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6">, </xsl:if>соблюдение карантинных фитосанитарных мер</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 8"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7">, </xsl:if>соблюдение мер нетарифного регулирования</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 9"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7 or nfc:CustomsInf/nfc:DocSign = 8">, </xsl:if>соблюдение специальных экономических мер</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 10"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7 or nfc:CustomsInf/nfc:DocSign = 8 or nfc:CustomsInf/nfc:DocSign = 9">, </xsl:if>соблюдение мер экспортного контроля, в том числе мер в отношении продукции военного назначения</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 11"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7 or nfc:CustomsInf/nfc:DocSign = 8 or nfc:CustomsInf/nfc:DocSign = 9 or nfc:CustomsInf/nfc:DocSign = 10">, </xsl:if>соблюдение прав на объекты интеллектуальной собственности</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 12"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7 or nfc:CustomsInf/nfc:DocSign = 8 or nfc:CustomsInf/nfc:DocSign = 9 or nfc:CustomsInf/nfc:DocSign = 10 or nfc:CustomsInf/nfc:DocSign = 11">, </xsl:if>применение льгот по уплате таможенных платежей</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 13"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7 or nfc:CustomsInf/nfc:DocSign = 8 or nfc:CustomsInf/nfc:DocSign = 9 or nfc:CustomsInf/nfc:DocSign = 10 or nfc:CustomsInf/nfc:DocSign = 11 or nfc:CustomsInf/nfc:DocSign = 12">, </xsl:if>применение ставки НДС в размере 10%</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 14"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7 or nfc:CustomsInf/nfc:DocSign = 8 or nfc:CustomsInf/nfc:DocSign = 9 or nfc:CustomsInf/nfc:DocSign = 10 or nfc:CustomsInf/nfc:DocSign = 11 or nfc:CustomsInf/nfc:DocSign = 12 or nfc:CustomsInf/nfc:DocSign = 13">, </xsl:if>контроль правильности исчисления таможенных пошлин, специальных, антидемпинговых, компенсационных пошлин, таможенных сборов за таможенные операции</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 15"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7 or nfc:CustomsInf/nfc:DocSign = 8 or nfc:CustomsInf/nfc:DocSign = 9 or nfc:CustomsInf/nfc:DocSign = 10 or nfc:CustomsInf/nfc:DocSign = 11 or nfc:CustomsInf/nfc:DocSign = 12 or nfc:CustomsInf/nfc:DocSign = 13 or nfc:CustomsInf/nfc:DocSign = 14">, </xsl:if>контроль правильности исчисления акциза</xsl:if>
									<xsl:if test="nfc:CustomsInf/nfc:DocSign = 16"><xsl:if test="nfc:CustomsInf/nfc:DocSign = 1 or nfc:CustomsInf/nfc:DocSign = 2 or nfc:CustomsInf/nfc:DocSign = 3 or nfc:CustomsInf/nfc:DocSign = 4 or nfc:CustomsInf/nfc:DocSign = 5 or nfc:CustomsInf/nfc:DocSign = 6 or nfc:CustomsInf/nfc:DocSign = 7 or nfc:CustomsInf/nfc:DocSign = 8 or nfc:CustomsInf/nfc:DocSign = 9 or nfc:CustomsInf/nfc:DocSign = 10 or nfc:CustomsInf/nfc:DocSign = 11 or nfc:CustomsInf/nfc:DocSign = 12 or nfc:CustomsInf/nfc:DocSign = 13 or nfc:CustomsInf/nfc:DocSign = 14 or nfc:CustomsInf/nfc:DocSign = 15">, </xsl:if>проверка количественных (весовых) характеристик товара, а также признаков, указывающих на недостоверность или неполноту заявленных в ДТ сведений</xsl:if>
									<xsl:text>.</xsl:text>
									<!--xsl:text>, и о </xsl:text>
									<xsl:choose>
										<xsl:when test="nfc:GuaranteeSign='1' or nfc:GuaranteeSign='true' or nfc:GuaranteeSign='TRUE' or nfc:GuaranteeSign='t'"><xsl:text>возможности </xsl:text></xsl:when>
										<xsl:otherwise><b><xsl:text>НЕвозможности </xsl:text></b></xsl:otherwise>
									</xsl:choose>
									<xsl:text>возврата (зачета) обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, </xsl:text>
									<xsl:text>компенсационных пошлин, представленного в соответствии с пунктом 1 статьи 121 Таможенного кодекса Евразийского экономического союза.</xsl:text-->
								</td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr class="delim">
								<td> </td>
							</tr>
							<tr>
								<td class="border_bottom" align="center">
									<span class="normal">
										<xsl:apply-templates select="nfc:CustomsPerson/cat_ru:PersonName"/>
									</span>
									<xsl:if test="nfc:CustomsPerson/cat_ru:LNP">
										<span class="normal"> (</span>
										<xsl:apply-templates select="nfc:CustomsPerson/cat_ru:LNP"/>
										<span class="normal">)</span>
									</xsl:if>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(Ф.И.О. уполномоченного должностного лица таможенного органа, ЭЦП)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<!--xsl:template match="nfc:DocSign">
		<xsl:choose>
			<xsl:when test=". = 1">таможенная стоимость товаров</xsl:when>
			<xsl:when test=". = 2">классификация товара в соответствии с ТН ВЭД ЕАЭС</xsl:when>
			<xsl:when test=". = 3">происхождение товаров и (или) тарифных преференциях</xsl:when>
			<xsl:when test=". = 4">соблюдение мер технического регулирования</xsl:when>
			<xsl:when test=". = 5">соблюдение санитарных мер</xsl:when>
			<xsl:when test=". = 6">соблюдение ветеринарно-санитарных мер</xsl:when>
			<xsl:when test=". = 7">соблюдение карантинных фитосанитарных мер</xsl:when>
			<xsl:when test=". = 8">соблюдение мер нетарифного регулирования</xsl:when>
			<xsl:when test=". = 9">соблюдение специальных экономических мер</xsl:when>
			<xsl:when test=". = 10">соблюдение мер экспортного контроля, в том числе мер в отношении продукции военного назначения</xsl:when>
			<xsl:when test=". = 11">соблюдение прав на объекты интеллектуальной собственности</xsl:when>
			<xsl:when test=". = 12">применение льгот по уплате таможенных платежей</xsl:when>
			<xsl:when test=". = 13">применение ставки НДС в размере 10%</xsl:when>
			<xsl:when test=". = 14">контроль правильности исчисления таможенных пошлин, специальных, антидемпинговых, компенсационных пошлин, таможенных сборов за таможенные операции</xsl:when>
			<xsl:when test=". = 15">контроль правильности исчисления акциза</xsl:when>
			<xsl:when test=". = 16">проверка количественных (весовых) характеристик товара, а также признаков, указывающих на недостоверность или неполноту заявленных в ДТ сведений</xsl:when>
			<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose>
	</xsl:template-->
	
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="nfc:GTDID">
		<span class="normal">
			<xsl:apply-templates select="cat_ru:CustomsCode"/>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:apply-templates select="cat_ru:GTDNumber"/>
		</span>
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
	<xsl:template name="russian_date_gtd">
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
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='NotifFinishControl']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
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
	<xsl:template match="*" mode="DateStr">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="DateStr">
				<xsl:with-param name="date" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
		&#160;&#160;<u>&#160;
		<xsl:choose>
				<xsl:when test="$month=1">января</xsl:when>
				<xsl:when test="$month=2">февраля</xsl:when>
				<xsl:when test="$month=3">марта</xsl:when>
				<xsl:when test="$month=4">апреля</xsl:when>
				<xsl:when test="$month=5">мая</xsl:when>
				<xsl:when test="$month=6">июня</xsl:when>
				<xsl:when test="$month=7">июля</xsl:when>
				<xsl:when test="$month=8">августа</xsl:when>
				<xsl:when test="$month=9">сентября</xsl:when>
				<xsl:when test="$month=10">октября</xsl:when>
				<xsl:when test="$month=11">ноября</xsl:when>
				<xsl:when test="$month=12">декабря</xsl:when>
			</xsl:choose> 					
		&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/>
		<u>
			<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;года&#160;
	</xsl:template>
</xsl:stylesheet>
