<?xml version="1.0" encoding="utf-8"?>
<!-- Форма не регламентирована -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ei="urn:customs.ru:Information:CustomsDocuments:ExpertiseInformation:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:param name="showLink"/>
	<!-- Шаблон для типа ExpertiseInformationType -->
	<xsl:template match="ei:ExpertiseInformation">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									width: 190mm;
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
								</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
									</font>
								</td>
							</tr>
							<tr>
								<td align="center" class="title">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Информация об экспертно-исследовательской работе</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер ЭИР</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ei:ExpertiseNumber"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ei:ExpertiseRegistrationDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата регистрации ЭИР</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ei:ExpertiseRegistrationDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ei:ExpertiseDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата проверки ЭИР</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ei:ExpertiseDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ei:DateReceiptSamples">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата поступления образцов исследования</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ei:DateReceiptSamples"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ei:ExpertiseBeginDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата начала проведения ЭИР</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ei:ExpertiseBeginDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:apply-templates select="ei:CEKTUDivision"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Срок проведения ЭИР</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ei:ExpertisePeriod"/>&#160;
								<xsl:if test="ei:ExpertisePeriodDayType">
									<xsl:choose>
										<xsl:when test="ei:ExpertisePeriodDayType='0'">
											<xsl:text>рабочих дней</xsl:text>
										</xsl:when>
										<xsl:when test="ei:ExpertisePeriodDayType='1'">
											<xsl:text>календарных дней</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>, тип дней: </xsl:text>
											<xsl:value-of select="ei:ExpertisePeriodDayType"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</td>
						</tr>
					</table>
					<xsl:if test="ei:ExpertiseDateStop">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Предварительная дата окончания ЭИР</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ei:ExpertiseDateStop"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ei:StageDesc">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Этап, на котором находится ЭИР</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ei:StageDesc"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="$showLink = '1'">
						<xsl:if test="ei:LinkToElQueue">
							<table class="w190">
								<tr>
									<td class="annot graphMain" style="width:50%">Ссылка на электронную очередь приема/выдачи образцов</td>
									<td class="value graphMain" style="width:50%">
										<xsl:value-of select="ei:LinkToElQueue"/>
									</td>
								</tr>
							</table>
						</xsl:if>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Действие по ЭИР</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ei:ExpertiseAction"/>
							</td>
						</tr>
					</table>
					<xsl:apply-templates select="ei:CustomsPerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ei:CEKTUDivisionInformationType -->
	<xsl:template match="ei:CEKTUDivision">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ei:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ei:Name"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ei:Address"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ei:PersonType -->
	<xsl:template match="ei:ExpertInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Эксперт, проводящий ЭИР</td>
				<td class="value graphMain" style="width:50%">
					<xsl:for-each select="*">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ei:PersonType -->
	<xsl:template match="ei:CustomsPerson">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Должностное лицо, сформировавшее уведомление</td>
				<td class="value graphMain" style="width:50%">
					<xsl:for-each select="*">
						<xsl:value-of select="concat(., ' ')"/>
					</xsl:for-each>
				</td>
			</tr>
		</table>
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
