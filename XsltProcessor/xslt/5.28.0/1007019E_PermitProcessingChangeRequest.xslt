<?xml version="1.0" encoding="utf-8"?>
<!-- Проект Приказа Минфина России "Об утверждении порядка выдачи разрешения на переработку товаров ..." -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:ppcr="urn:customs.ru:Information:ProcessingDocuments:PermitProcessingChangeRequest:5.28.0">
	<!-- Шаблон для типа PermitProcessingChangeRequestType -->
	<xsl:template match="ppcr:PermitProcessingChangeRequest">
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
                  font-family: Arial;
                  font-size: 11pt;
                  vertical-align:bottom;
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
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:choose>
												<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='21'">
													<xsl:text>Заявление о внесении изменений в разрешение на переработку товаров вне таможенной территории</xsl:text>
												</xsl:when>
												<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='51'">
													<xsl:text>Заявление о внесении изменений (дополнений) в разрешение на переработку товаров на таможенной территории</xsl:text>
												</xsl:when>
												<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='91'">
													<xsl:text>Заявление о внесении изменений в разрешение на переработку товаров для внутреннего потребления</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Заявление о внесении изменений в разрешение на переработку товаров</xsl:text>
												</xsl:otherwise>
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
							<td class="annot" style="width:35%"/>
							<td class="annot" style="width:17%">Начальнику</td>
							<td class="value" style="width:3%"/>
							<td class="value" style="width:45%">
								<xsl:for-each select="ppcr:Customs">
									<xsl:if test="cat_ru:OfficeName">
										<xsl:text>(</xsl:text>
									</xsl:if>
									<xsl:value-of select="cat_ru:Code"/>
									<xsl:if test="cat_ru:OfficeName">
										<xsl:text>) </xsl:text>
										<xsl:value-of select="cat_ru:OfficeName"/>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="underline" colspan="2"/>
							<td class="underline" colspan="2" align="center">(наименование таможни)</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot" style="width:35%"/>
							<td class="annot" style="width:7%">От</td>
							<td class="value" style="width:3%"/>
							<td class="value" style="width:55%">
								<xsl:for-each select="ppcr:ApplicantInfomation">
									<xsl:value-of select="ppcr:OrganizationName"/>
									<xsl:if test="ppcr:ShortName">
										<xsl:if test="ppcr:OrganizationName">
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="ppcr:ShortName"/>
										<xsl:if test="ppcr:OrganizationName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:if test="ppcr:OrganizationName or ppcr:ShortName">
										<br/>
									</xsl:if>
									<xsl:text>ИНН </xsl:text>
									<xsl:value-of select="ppcr:INN"/>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="underline" colspan="2"/>
							<td class="underline" colspan="2" align="center">
								<xsl:choose>
									<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='21'">
										<xsl:text>(полное наименование лица, получившего разрешение на переработку товаров вне таможенной территории, его идентификационный номер налогоплательщика)</xsl:text>
									</xsl:when>
									<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='51'">
										<xsl:text>(наименование лица, получившего разрешение на переработку товаров на таможенной территории, его идентификационный номер налогоплательщика)</xsl:text>
									</xsl:when>
									<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='91'">
										<xsl:text>(наименование лица, получившего разрешение на переработку товаров для внутреннего потребления, его идентификационный номер налогоплательщика)</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>(наименование лица, получившего разрешение на переработку товаров)</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<br/>
					<table class="ext">
						<tr>
							<td class="annot">
								<p style="text-indent: 5%;text-align: justify;">
									<xsl:choose>
										<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='21'">
											<xsl:text>Просим внести в пункт (пункты) № </xsl:text>
											<u>&#160;&#160;
												<xsl:for-each select="ppcr:ChangeInfomation[not(./ppcr:ClauseNumber = preceding-sibling::ppcr:ChangeInfomation/ppcr:ClauseNumber)]"> 
													<xsl:value-of select="ppcr:ClauseNumber"/> 
													<xsl:if test="position()!=last()">, </xsl:if> 
												</xsl:for-each>
											&#160;&#160;</u>
											<xsl:text>&#160;разрешения на переработку товаров вне таможенной территории №	</xsl:text>
											<u>&#160;&#160;<xsl:apply-templates select="ppcr:PermitNumber"/>&#160;&#160;</u>
											<xsl:text>&#160;следующие изменения:</xsl:text>
										</xsl:when>
										<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='51'">
											<xsl:text>Прошу внести изменения в пункт (пункты) № </xsl:text>
											<u>&#160;&#160;
												<xsl:for-each select="ppcr:ChangeInfomation[not(./ppcr:ClauseNumber = preceding-sibling::ppcr:ChangeInfomation/ppcr:ClauseNumber)]"> 
													<xsl:value-of select="ppcr:ClauseNumber"/> 
													<xsl:if test="position()!=last()">, </xsl:if> 
												</xsl:for-each>
											&#160;&#160;</u>
											<xsl:text>&#160;разрешения на переработку товаров на таможенной территории № </xsl:text>
											<u>&#160;&#160;<xsl:apply-templates select="ppcr:PermitNumber"/>&#160;&#160;</u>
											<xsl:text>&#160;следующие изменения (или дополнения).</xsl:text>
										</xsl:when>
										<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='91'">
											<xsl:text>Прошу внести изменения в пункт (пункты) № </xsl:text>
											<u>&#160;&#160;
												<xsl:for-each select="ppcr:ChangeInfomation[not(./ppcr:ClauseNumber = preceding-sibling::ppcr:ChangeInfomation/ppcr:ClauseNumber)]"> 
													<xsl:value-of select="ppcr:ClauseNumber"/> 
													<xsl:if test="position()!=last()">, </xsl:if> 
												</xsl:for-each>
											&#160;&#160;</u>
											<xsl:text>&#160;разрешения на переработку товаров для внутреннего потребления № </xsl:text>
											<u>&#160;&#160;<xsl:apply-templates select="ppcr:PermitNumber"/>&#160;&#160;</u>
											<xsl:text>&#160;следующие изменения.</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>Внести</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</p>
							</td>
						</tr>
					</table>
					<table class="border">
						<tr class="title">
							<td align="center" width="10%">Пункт Разре- шения на пере- работку</td>
							<td align="center" width="30%">Описание предполагаемых изменений</td>
							<td align="center" width="30%">Причины предполагаемых изменений</td>
							<td align="center" width="30%">Обоснование для внесения изменений</td>
						</tr>
						<xsl:for-each select="ppcr:ChangeInfomation">
							<tr valign="top">
								<td align="center" style="font-family: Arial; font-size: 11pt;"><xsl:value-of select="ppcr:ClauseNumber"/></td>
								<td style="font-family: Arial; font-size: 11pt;"><xsl:apply-templates mode="space" select="ppcr:ChangeDescription"/></td>
								<td style="font-family: Arial; font-size: 11pt;"><xsl:apply-templates mode="space" select="ppcr:ReasonDescription"/></td>
								<td style="font-family: Arial; font-size: 11pt;"><xsl:apply-templates mode="space" select="ppcr:ExcuseDescription"/></td>
							</tr>
						</xsl:for-each>
					</table>
					<br/>
					<table class="ext">
						<tr>
							<td class="annot">
								<p style="text-indent: 5%;">
									<xsl:text>Приложение:</xsl:text>
								</p>
							</td>
						</tr>
					</table>		
					<table class="ext_border"> <!--таблица в таблице для красивого отступа от внешних границ-->
						<tr>
							<td align="center">
								<table class="int">
									<tr>
										<td class="annot">
											<p style="text-indent: 5%;text-align:justify;">
												<xsl:choose>
													<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='21'">
														<xsl:text>Перечень документов, прикладываемых к заявлению о внесении изменений в разрешение на переработку товаров </xsl:text>
														<xsl:text>вне таможенной территории, подтверждающих изменения, вносимые в соответствующие пункты разрешения </xsl:text>
														<xsl:text>на переработку товаров вне таможенной территории</xsl:text>
													</xsl:when>
													<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='51'">
														<xsl:text>Перечень документов, приложенных к заявлению о внесении изменений (дополнений) в разрешение на переработку товаров </xsl:text>
														<xsl:text>на таможенной территории, подтверждающих изменения (или дополнения), вносимые в соответствующие пункты </xsl:text>
														<xsl:text>разрешения на переработку товаров на таможенной территории:</xsl:text>
													</xsl:when>
													<xsl:when test="ppcr:PermitNumber/catProc_ru:ProcessingProcedureCode='91'">
														<xsl:text>Перечень документов, приложенных к заявлению о внесении изменений в разрешение на переработку товаров </xsl:text>
														<xsl:text>для внутреннего потребления, подтверждающих изменения, вносимые в соответствующие пункты </xsl:text>
														<xsl:text>разрешения на переработку товаров для внутреннего потребления:</xsl:text>
													</xsl:when>
												</xsl:choose>
											</p>
										</td>
									</tr>
									<xsl:for-each select="ppcr:ReasonDocuments">
										<tr>
											<td class="value">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</table>
					<br/>
					<br/>
					<table>
						<tr>
							<td class="annot">
								<xsl:apply-templates select="ppcr:ApplicantPersonSignature">
									<xsl:with-param name="fio_descr" select="'Фамилия, имя, отчество (при наличии) руководителя лица'"/>
								</xsl:apply-templates>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="space">
		<xsl:if test="position() &gt; 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="."/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="ppcr:ReasonDocuments">
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
	<!-- cat_ru:PersonSignatureType -->
	<xsl:template match="ppcr:ApplicantPersonSignature">
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
					<td class="underline" colspan="5"> <br/></td>
				</tr>
				<tr>
					<td class="annot" colspan="5">
						<xsl:text>Оттиск печати (при наличии)</xsl:text>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:PermitNumberType -->
	<xsl:template match="ppcr:PermitNumber">
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
</xsl:stylesheet>
