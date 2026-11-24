<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:een="urn:customs.ru:Information:CustomsDocuments:ExpertiseExtensionNotice:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExpertiseExtensionNoticeType -->
	<xsl:template match="een:ExpertiseExtensionNotice">
		<xsl:param name="w" select="190"/>
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
				<div class="page" style="width: {$w}mm;">
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
								<td align="center" class="title"><br/> </td>
							</tr>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Уведомление о продлении экспертно-исследовательской работы</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="een:DocumentRegNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер уведомления</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="een:DocumentRegNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер ЭИР</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="een:ExpertiseNumber"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата поступления образцов исследования</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="een:DateReceiptSamples"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата начала проведения ЭИР</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="een:ExpertiseBeginDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="een:CEKTUDivision">
						<xsl:for-each select="een:CEKTUDivision">
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Код подразделения ЦЭКТУ</td>
									<td class="value graphMain" style="width:50%">
										<xsl:value-of select="een:CustomsCode"/>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Наименование подразделения ЦЭКТУ</td>
									<td class="value graphMain" style="width:50%">
										<xsl:value-of select="een:Name"/>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td class="annot graphMain" style="width:50%">Адрес подразделения ЦЭКТУ</td>
									<td class="value graphMain" style="width:50%">
										<xsl:value-of select="een:Address"/>
									</td>
								</tr>
							</table>
						</xsl:for-each>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Срок проведения ЭИР</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="een:ExpertisePeriod"/>
								<xsl:if test="een:ExpertisePeriodDayType">&#160;
									<xsl:choose>
										<xsl:when test="een:ExpertisePeriodDayType='0'">
											<xsl:text>рабочих дней</xsl:text>
										</xsl:when>
										<xsl:when test="een:ExpertisePeriodDayType='1'">
											<xsl:text>календарных дней</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>, тип дней: </xsl:text><xsl:value-of select="een:ExpertisePeriodDayType"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</td>
						</tr>
					</table>
					<xsl:if test="een:ExpertiseDateStop">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Предполагаемая дата окончания ЭИР</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="een:ExpertiseDateStop"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="een:StageDesc">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Этап, на котором находится ЭИР</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="een:StageDesc"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Действие по ЭИР</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="een:ExpertiseAction"/>
							</td>
						</tr>
					</table>
					<xsl:if test="een:ReasonExtension">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Причина продления</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="een:ReasonExtension"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="een:CustomsPerson">
						<div class="title marg-top">Должностное лицо, сформировавшее уведомление:</div>
						<div>
							<xsl:apply-templates select="een:CustomsPerson">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа een:PersonType -->
	<xsl:template match="een:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия Имя Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</xsl:if>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Телефон</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="een:Phone"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="een:DocumentRegNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
