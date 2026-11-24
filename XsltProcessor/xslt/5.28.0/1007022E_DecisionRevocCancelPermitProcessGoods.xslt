<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:drcppd="urn:customs.ru:Information:ProcessingDocuments:DecisionRevocCancelPermitProcessGoods:5.28.0">
	<xsl:variable name="indent" select="2"/>
	<!-- Шаблон для типа DecisionRevocCancelPermitProcessGoodsType -->
	<xsl:template match="drcppd:DecisionRevocCancelPermitProcessGoods">
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
                  font-size: 11pt;
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

				.inlinetable
				{
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
				}

                </style>
			</head>
			<body>
				<xsl:variable name="ProcessingProcedureCode" select="drcppd:PermitNumber/catProc_ru:ProcessingProcedureCode"/>
				<div class="page" style="width: {$w}mm;">
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:choose>
												<xsl:when test="drcppd:DecisionKind='1'">
													<xsl:text>Решение об отзыве разрешения на переработку товаров </xsl:text>
												</xsl:when>
												<xsl:when test="drcppd:DecisionKind='2'">
													<xsl:text>Решение об аннулировании разрешения на переработку товаров </xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Решение об отзыве, аннулировании разрешения на переработку товаров </xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="$ProcessingProcedureCode='21'"><xsl:text>вне таможенной территории </xsl:text></xsl:when>
												<xsl:when test="$ProcessingProcedureCode='51'"><xsl:text>на таможенной территории </xsl:text></xsl:when>
												<xsl:when test="$ProcessingProcedureCode='91'"><xsl:text>для внутреннего потребления </xsl:text></xsl:when>
												<xsl:otherwise><xsl:text>НЕИЗВЕСТНО ГДЕ </xsl:text></xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot_t">
								<p style="text-indent: {$indent}%; text-align:justify;">
									<xsl:choose>
										<xsl:when test="drcppd:DecisionKind='1'"><xsl:text>Отзывается</xsl:text></xsl:when>
										<xsl:when test="drcppd:DecisionKind='2'"><xsl:text>Аннулируется</xsl:text></xsl:when>
										<xsl:otherwise><xsl:text>Отзывается (аннулируется)</xsl:text></xsl:otherwise>
									</xsl:choose>
									<xsl:text> c </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="drcppd:DateRevocCancel"/>
											</xsl:call-template>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(число, месяц, год)'"/>
										<xsl:with-param name="width" select="'20%'"/>
									</xsl:call-template>
									<xsl:choose>
										<xsl:when test="$ProcessingProcedureCode='21'"><xsl:text>&#160;разрешение на переработку товаров вне таможенной территории </xsl:text></xsl:when>
										<xsl:when test="$ProcessingProcedureCode='51'"><xsl:text>&#160;разрешение на переработку товаров на таможенной территории </xsl:text></xsl:when>
										<xsl:when test="$ProcessingProcedureCode='91'"><xsl:text>&#160;разрешение на переработку товаров для внутреннего потребления </xsl:text></xsl:when>
										<xsl:otherwise><xsl:text>&#160;разрешение на переработку товаров НЕИЗВЕСТНО ГДЕ </xsl:text></xsl:otherwise>
									</xsl:choose>
									<xsl:text> №&#160;</xsl:text>
									<u>&#160;&#160;<xsl:apply-templates select="drcppd:PermitNumber"/>&#160;&#160;</u>
									<xsl:text>, выданное</xsl:text>
								</p>
							</td>
						</tr>
						<tr>
							<td class="value">
								<xsl:value-of select="drcppd:ApplicantInfomation/drcppd:OrganizationName"/>
								<xsl:if test="drcppd:ApplicantInfomation/cat_ru:ShortName">
									<xsl:if test="drcppd:ApplicantInfomation/cat_ru:OrganizationName">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="drcppd:ApplicantInfomation/cat_ru:ShortName"/>
									<xsl:if test="drcppd:ApplicantInfomation/cat_ru:OrganizationName">
										<xsl:text>)</xsl:text>
									</xsl:if>
								</xsl:if>
								<xsl:text>, ИНН </xsl:text>
								<xsl:value-of select="drcppd:ApplicantInfomation/drcppd:INN"/>
							</td>
						</tr>
						<tr>
							<td class="underline" align="center">
								<xsl:choose>
									<xsl:when test="$ProcessingProcedureCode='21'">
										<xsl:text>(указываются полное наименование и идентификационный номер налогоплательщика лица, получившего разрешение на переработку товаров вне таможенной территории)</xsl:text>
									</xsl:when>
									<xsl:when test="$ProcessingProcedureCode='51'">
										<xsl:text>(указываются полное наименование и идентификационный номер налогоплательщика лица, получившего разрешение на переработку товаров на таможенной территории)</xsl:text>
									</xsl:when>
									<xsl:when test="$ProcessingProcedureCode='91'">
										<xsl:text>(указываются полное и сокращенное наименование лица, его идентификационный номер налогоплательщика)</xsl:text>
									</xsl:when>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="annot_t">
								<xsl:text>на основании</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="value">
								<xsl:apply-templates select="drcppd:Reason"/>
							</td>
						</tr>
						<tr>
							<td class="underline" align="center">
								<xsl:text>(указываются причины </xsl:text>
								<xsl:choose>
									<xsl:when test="drcppd:DecisionKind='1'"><xsl:text>отзыва</xsl:text></xsl:when>
									<xsl:when test="drcppd:DecisionKind='2'"><xsl:text>аннулирования</xsl:text></xsl:when>
									<xsl:otherwise>
										<xsl:text>отзыва либо аннулирования</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> разрешения на переработку в соответствии с положениями статьи </xsl:text>
								<xsl:choose>
									<xsl:when test="$ProcessingProcedureCode='21'"><xsl:text>142</xsl:text></xsl:when>
									<xsl:when test="$ProcessingProcedureCode='51'"><xsl:text>131</xsl:text></xsl:when>
									<xsl:when test="$ProcessingProcedureCode='91'"><xsl:text>153</xsl:text></xsl:when>
								</xsl:choose>
								<xsl:text> Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации </xsl:text>
								<xsl:text>и о внесении изменений в отдельные законодательные акты Российской Федерации»)</xsl:text>
							</td>
						</tr>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot">
								<xsl:apply-templates select="drcppd:PersonSignature">
									<xsl:with-param name="fio_descr" select="'Фамилия, имя, отчество (при наличии) начальника таможни (лица, его замещающего)'"/>
								</xsl:apply-templates>
							</td>
						</tr>
						<tr>
							<td class="underline">
								<br/>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- cat_ru:PersonSignatureType -->
	<xsl:template match="drcppd:PersonSignature">
		<xsl:param name="fio_descr" select="''"/>
		<table>
			<tbody>
				<tr>
					<td class="value" width="50%" align="center">
						<xsl:if test="cat_ru:PersonPost">
							<xsl:value-of select="cat_ru:PersonPost"/>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</xsl:if>
					</td>
					<td class="annot" width="3%"/>
					<td class="value" width="24%"/>
					<td class="annot" width="3%"/>
					<td class="value" width="20%" align="center">
						<xsl:if test="cat_ru:IssueDate">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
							</xsl:call-template>
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
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:PermitNumberType -->
	<xsl:template match="drcppd:PermitNumber">
		<xsl:value-of select="catProc_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="catProc_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catProc_ru:ProcessingProcedureCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="catProc_ru:Number"/>
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
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="underline">
						<xsl:value-of select="$description" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
