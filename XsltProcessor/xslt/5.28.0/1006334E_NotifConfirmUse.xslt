<?xml version="1.0" encoding="utf-8"?>
<!--Решение Совета ЕЭК от 12.11.2021 № 130 "О Порядке ввоза на таможенную территорию Евразийского экономического союза продукции, подлежащей обязательной оценке соответствия на таможенной территории Евразийского экономического союза"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:ncu="urn:customs.ru:Information:CustomsDocuments:NotifConfirmUse:5.28.0">
	<!-- Шаблон для типа NotifConfirmUseType -->
	<xsl:template match="ncu:NotifConfirmUse">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					/*div{white-space: nowrap;}*/

					div.page
					{width: 180mm;
					max-width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					page-break-after: always;}

					.marg-top
					{margin-top: 5mm;}

					table
					{table-layout: fixed;
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;}

					div.title, tr.title td
					{font-weight: bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					.border_bottom
					{border-bottom: 1px solid black;}

					.graphMain
					{font-family: Arial;
					font-size: 11pt;}

					.graphLittle 
					{font-family: Arial;
					font-size: 7pt;}

					.graphDelim 
					{font-family: Arial;
					font-size: 4pt;}

					td.graphMain
					{vertical-align: top;}

					td.value.graphMain
					{vertical-align: top;}

					.graphHeader
					{font-family: Arial;
					font-size: 11.5pt;
					font-weight: bold;}

					td.graphHeader
					{vertical-align: top;}

					td.value.graphHeader
					{vertical-align: bottom;}

					.normal
					{font-size: 11pt;
					font-family: Arial;}			

					.bold
					{font-weight: bold;
					font-family: Arial;
					font-size: 9pt;}			

					.italic
					{font-style: italic;
					font-family: Arial;
					font-size: 11pt;}		

					.delim
					{height: 7pt;}

					.delim_3
					{height: 3pt;}

					.inlinetable
					{font-family: Arial;
					font-size: 11pt;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					.descr
					{font-size: 8pt;
					text-align: center;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td class="graphHeader" align="center">
									<xsl:text>УВЕДОМЛЕНИЕ</xsl:text>
									<br/>
									<xsl:text>о подтверждении использования в заявленных нуждах и целях ввозимой (ввезенной) продукции, подлежащей обязательной оценке соответствия на таможенной территории Евразийского экономического союза, в отношении которой при помещении под таможенные процедуры не требуется подтверждение соблюдения мер технического регулирования</xsl:text>
									<br/>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text>№ Р130/6/</xsl:text>
											<xsl:value-of select="ncu:NotifNumber/ncu:Sub-ItemNumber"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="ncu:NotifNumber/ncu:TNVEDCode"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="ncu:NotifNumber/ncu:ActOfLawNumber"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="ncu:NotifNumber/ncu:INN"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="ncu:NotifNumber/ncu:NumberPP"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(номер уведомления, присвоенный декларантом)'"/>
										<xsl:with-param name="width" select="'105mm'"/>
										<xsl:with-param name="text_transform" select="'uppercase'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="normal" align="left">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="normal" align="left">
									<xsl:text>НАСТОЯЩИМ </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="ncu:Declarant"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование (Ф.И.О.) декларанта)'"/>
										<xsl:with-param name="width" select="'130mm'"/>
									</xsl:call-template>
									<xsl:text> УВЕДОМЛЯЕТ</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td class="normal" align="justify" style="text-align: justify;">
									<xsl:text>о ввозе на таможенную территорию Евразийского экономического союза продукции</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="normal" align="left">
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text>(</xsl:text>
											<xsl:for-each select="ncu:ProductDesignation">
												<xsl:call-template name="Designation"/>
												<xsl:if test="position()!=last()">
													<xsl:text>; </xsl:text>
												</xsl:if>
											</xsl:for-each>
											<xsl:text>)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(обозначение продукции (тип, марка, модель, артикул и др.))'"/>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="comma" select="'1'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="normal" align="left" style="text-align: justify; width:180mm;">
									<xsl:text>подлежащей обязательной оценке соответствия на таможенной территории Евразийского экономического союза, в отношении которой не требуется подтверждение соблюдения мер технического регулирования</xsl:text>
									<br/>
									<br/>
									<xsl:text>СОГЛАСНО</xsl:text>
									<br/>
									<br/>
									<xsl:text>подпункту "</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="ncu:Sub-ItemNumber"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'5mm'"/>
									</xsl:call-template>
									<xsl:text>" пункта 6 Порядка ввоза на таможенную территорию Евразийского экономического союза продукции, подлежащей обязательной оценке соответствия на таможенной территории Евразийского экономического союза, утвержденного Решением Совета Евразийской экономической комиссии от 12 ноября 2021 г. N130.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td class="normal" align="left" style="text-align: justify; width:100mm;">
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:if test="ncu:SigningPerson/cat_ru:PersonPost">
												<xsl:value-of select="ncu:SigningPerson/cat_ru:PersonPost"/>
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:value-of select="ncu:SigningPerson/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(ncu:SigningPerson/cat_ru:PersonName,1,1)"/>
											<xsl:text>.</xsl:text>
											<xsl:if test="ncu:SigningPerson/cat_ru:PersonMiddleName">
												<xsl:value-of select="substring(ncu:SigningPerson/cat_ru:PersonMiddleName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(должность, Ф.И.О.)'"/>
										<xsl:with-param name="width" select="'100mm'"/>
									</xsl:call-template>
								</td>
								<td class="normal" align="left" style="text-align: justify; width:40mm;"></td>
								<td class="normal" align="left" style="text-align: justify; width:40mm;">
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text> </xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(подпись)'"/>
										<xsl:with-param name="width" select="'40mm'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td class="normal" align="left" style="text-align: justify; width:100mm;">
									<xsl:text>Дата </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ncu:SigningDate"/></xsl:call-template>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'30mm'"/>
									</xsl:call-template>
								</td>
								<td class="normal" align="left" style="text-align: justify; width:40mm;"></td>
								<td class="normal" align="center" style="width:40mm;">
									<xsl:text>МП</xsl:text>
									<br/>
									<xsl:text>(при наличии)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="ncu:ActOfLawNumber">
		<xsl:choose>
			<xsl:when test="ncu:ActOfLawKind = 1">ТР</xsl:when>
			<xsl:when test="ncu:ActOfLawKind = 2">Р620</xsl:when>
			<xsl:when test="ncu:ActOfLawKind = 3">ФЗ</xsl:when>
			<xsl:when test="ncu:ActOfLawKind = 4">ПП</xsl:when>
		</xsl:choose>
		<xsl:for-each select="ncu:NumberPP">
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="text_transform" select="'none'"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}" style="text-transform: {$text_transform}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="Designation">
		<xsl:apply-templates select="ncu:GoodsDescription"/>
		<xsl:if test="ncu:GoodsMark">
			<xsl:text>, марка: </xsl:text>
			<xsl:value-of select="ncu:GoodsMark"/>
		</xsl:if>
		<xsl:if test="ncu:GoodsModel">
			<xsl:text>, модель: </xsl:text>
			<xsl:value-of select="ncu:GoodsModel"/>
		</xsl:if>
		<xsl:if test="ncu:GoodsMarking">
			<xsl:text>, артикул: </xsl:text>
			<xsl:value-of select="ncu:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="ncu:GoodsSort">
			<xsl:text>, сорт: </xsl:text>
			<xsl:value-of select="ncu:GoodsSort"/>
		</xsl:if>
		<xsl:if test="ncu:GoodsGroupQuantity">
			<xsl:text>, количество: </xsl:text>
			<xsl:value-of select="ncu:GoodsGroupQuantity/catESAD_cu:GoodsQuantity"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ncu:GoodsGroupQuantity/catESAD_cu:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="ncu:NetWeightQuantity">
			<xsl:text>, вес нетто: </xsl:text>
			<xsl:value-of select="ncu:NetWeightQuantity"/>
			<xsl:text> кг</xsl:text>
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
</xsl:stylesheet>
