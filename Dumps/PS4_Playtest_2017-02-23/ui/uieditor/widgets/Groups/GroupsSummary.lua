require( "ui.uieditor.widgets.BorderBakedStroke" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Groups.GroupEmblemWidget" )
require( "ui.uieditor.widgets.Groups.GroupLevel" )
require( "ui.uieditor.widgets.Groups.GroupMemberSummary" )
require( "ui.uieditor.widgets.Groups.GroupsSummaryStatus" )
require( "ui.uieditor.widgets.Groups.GroupsSummaryTBD" )

CoD.GroupsSummary = InheritFrom( LUI.UIElement )
CoD.GroupsSummary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GroupsSummary )
	self.id = "GroupsSummary"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 690 )
	self.anyChildUsesUpdateState = true
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( 0, 1, 0, 0 )
	Backing:setTopBottom( 0, 1, 0, 0 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 24, 501 )
	Image1:setTopBottom( 0, 0, 496, 530 )
	Image1:setAlpha( 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local GroupMemberSummary = CoD.GroupMemberSummary.new( menu, controller )
	GroupMemberSummary:setLeftRight( 0, 0, 21, 501 )
	GroupMemberSummary:setTopBottom( 0, 0, 537, 635 )
	GroupMemberSummary.MemberCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_MEMBERS" ) ) )
	GroupMemberSummary.PlayingCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_PLAYING" ) ) )
	GroupMemberSummary.OnlineCount.Title:setText( Engine.Localize( AppendString( "_CAPS", "GROUPS_ONLINE" ) ) )
	GroupMemberSummary:linkToElementModel( self, "memberCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupMemberSummary.MemberCount.Count:setText( Engine.Localize( modelValue ) )
		end
	end )
	GroupMemberSummary:linkToElementModel( self, "inTitleCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupMemberSummary.PlayingCount.Count:setText( Engine.Localize( modelValue ) )
		end
	end )
	GroupMemberSummary:linkToElementModel( self, "onlineCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupMemberSummary.OnlineCount.Count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupMemberSummary )
	self.GroupMemberSummary = GroupMemberSummary
	
	local GroupLevelWidget = CoD.GroupLevel.new( menu, controller )
	GroupLevelWidget:setLeftRight( 0, 0, 297, 519 )
	GroupLevelWidget:setTopBottom( 0, 0, 696, 772 )
	GroupLevelWidget:setAlpha( 0 )
	self:addElement( GroupLevelWidget )
	self.GroupLevelWidget = GroupLevelWidget
	
	local Owner = LUI.UITightText.new()
	Owner:setLeftRight( 0, 0, 542, 605 )
	Owner:setTopBottom( 0, 0, 374, 398 )
	Owner:setRGB( 0.5, 0.51, 0.52 )
	Owner:setAlpha( 0 )
	Owner:setText( Engine.Localize( "GROUPS_OWNER" ) )
	Owner:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( Owner )
	self.Owner = Owner
	
	local OwnerName = LUI.UIText.new()
	OwnerName:setLeftRight( 0, 0, 756, 1022 )
	OwnerName:setTopBottom( 0, 0, 374, 398 )
	OwnerName:setAlpha( 0 )
	OwnerName:setTTF( "fonts/UnitedSansRgMd.ttf" )
	OwnerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OwnerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	OwnerName:linkToElementModel( self, "owner", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			OwnerName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( OwnerName )
	self.OwnerName = OwnerName
	
	local GroupLevel = LUI.UITightText.new()
	GroupLevel:setLeftRight( 0, 0, 25, 187 )
	GroupLevel:setTopBottom( 0, 0, 715, 753 )
	GroupLevel:setRGB( 0.5, 0.51, 0.52 )
	GroupLevel:setAlpha( 0 )
	GroupLevel:setText( Engine.Localize( "GROUPS_GROUP_LEVEL" ) )
	GroupLevel:setTTF( "fonts/default.ttf" )
	self:addElement( GroupLevel )
	self.GroupLevel = GroupLevel
	
	local Country = LUI.UITightText.new()
	Country:setLeftRight( 0, 0, 541, 621 )
	Country:setTopBottom( 0, 0, 334, 358 )
	Country:setRGB( 0.5, 0.51, 0.52 )
	Country:setAlpha( 0 )
	Country:setText( Engine.Localize( "GROUPS_COUNTRY" ) )
	Country:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( Country )
	self.Country = Country
	
	local CountryName = LUI.UIText.new()
	CountryName:setLeftRight( 0, 0, 756, 1022 )
	CountryName:setTopBottom( 0, 0, 334, 358 )
	CountryName:setAlpha( 0 )
	CountryName:setText( Engine.Localize( "GROUPS_UNITED_STATES" ) )
	CountryName:setTTF( "fonts/UnitedSansRgMd.ttf" )
	CountryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CountryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CountryName )
	self.CountryName = CountryName
	
	local Language = LUI.UITightText.new()
	Language:setLeftRight( 0, 0, 32, 114 )
	Language:setTopBottom( 0, 0, 502, 526 )
	Language:setRGB( 0.5, 0.51, 0.52 )
	Language:setAlpha( 0 )
	Language:setText( Engine.Localize( "GROUPS_LANGUAGE" ) )
	Language:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Language )
	self.Language = Language
	
	local LanguageName = LUI.UIText.new()
	LanguageName:setLeftRight( 0, 0, 124, 390 )
	LanguageName:setTopBottom( 0, 0, 502, 526 )
	LanguageName:setAlpha( 0 )
	LanguageName:setText( Engine.Localize( "GROUPS_ENGLISH" ) )
	LanguageName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	LanguageName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	LanguageName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LanguageName )
	self.LanguageName = LanguageName
	
	local GroupsSummaryStatus0 = CoD.GroupsSummaryStatus.new( menu, controller )
	GroupsSummaryStatus0:setLeftRight( 0, 0, 24, 504 )
	GroupsSummaryStatus0:setTopBottom( 0, 0, 353, 379 )
	GroupsSummaryStatus0:linkToElementModel( self, nil, false, function ( model )
		GroupsSummaryStatus0:setModel( model, controller )
	end )
	self:addElement( GroupsSummaryStatus0 )
	self.GroupsSummaryStatus0 = GroupsSummaryStatus0
	
	local GroupClanTag = LUI.UIText.new()
	GroupClanTag:setLeftRight( 0, 0, 541, 680 )
	GroupClanTag:setTopBottom( 0, 0, 431, 461 )
	GroupClanTag:setRGB( 0, 0, 0 )
	GroupClanTag:setAlpha( 0 )
	GroupClanTag:setTTF( "fonts/UnitedSansRgMd.ttf" )
	GroupClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GroupClanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupClanTag:setText( modelValue )
		end
	end )
	self:addElement( GroupClanTag )
	self.GroupClanTag = GroupClanTag
	
	local Line1 = LUI.UIImage.new()
	Line1:setLeftRight( 0, 0, 21, 501 )
	Line1:setTopBottom( 0, 0, 343, 349 )
	Line1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local Line2 = LUI.UIImage.new()
	Line2:setLeftRight( 0, 0, 21, 501 )
	Line2:setTopBottom( 0, 0, 383, 389 )
	Line2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local Line3 = LUI.UIImage.new()
	Line3:setLeftRight( 0, 0, 21, 501 )
	Line3:setTopBottom( 0, 0, 521, 527 )
	Line3:setAlpha( 0 )
	Line3:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line3 )
	self.Line3 = Line3
	
	local GroupsSummaryTBD0 = CoD.GroupsSummaryTBD.new( menu, controller )
	GroupsSummaryTBD0:setLeftRight( 0, 0, 154.5, 373.5 )
	GroupsSummaryTBD0:setTopBottom( 0, 0, 238, 430 )
	GroupsSummaryTBD0:setAlpha( 0 )
	self:addElement( GroupsSummaryTBD0 )
	self.GroupsSummaryTBD0 = GroupsSummaryTBD0
	
	local CountryFlagImage = LUI.UIImage.new()
	CountryFlagImage:setLeftRight( 0, 0, 444, 492 )
	CountryFlagImage:setTopBottom( 0, 0, 496, 530 )
	CountryFlagImage:setAlpha( 0 )
	CountryFlagImage:setImage( RegisterImage( "uie_img_t7_menu_groups_flag_us" ) )
	self:addElement( CountryFlagImage )
	self.CountryFlagImage = CountryFlagImage
	
	local BorderBakedStroke0 = CoD.BorderBakedStroke.new( menu, controller )
	BorderBakedStroke0:setLeftRight( 0, 0, 21, 504 )
	BorderBakedStroke0:setTopBottom( 0, 0, 68, 335 )
	self:addElement( BorderBakedStroke0 )
	self.BorderBakedStroke0 = BorderBakedStroke0
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 0, 24, 501 )
	cacItemTitleGlow0:setTopBottom( 0, 0, 9, 62 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -79, 75 )
	Glow:setTopBottom( 0.5, 0.5, -364, -254 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local GroupEmblemWidget = CoD.GroupEmblemWidget.new( menu, controller )
	GroupEmblemWidget:setLeftRight( 0, 0, 32, 492 )
	GroupEmblemWidget:setTopBottom( 0, 0, 77, 325 )
	GroupEmblemWidget:linkToElementModel( self, nil, false, function ( model )
		GroupEmblemWidget:setModel( model, controller )
	end )
	GroupEmblemWidget:linkToElementModel( self, "groupId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupEmblemWidget.GroupEmblem:setupGroupEmblem( modelValue )
		end
	end )
	self:addElement( GroupEmblemWidget )
	self.GroupEmblemWidget = GroupEmblemWidget
	
	local GroupDescription0 = LUI.UIText.new()
	GroupDescription0:setLeftRight( 0, 0, 24, 504 )
	GroupDescription0:setTopBottom( 0, 0, 404, 428 )
	GroupDescription0:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	GroupDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupDescription0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GroupDescription0:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupDescription0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupDescription0 )
	self.GroupDescription0 = GroupDescription0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 32, 332 )
	TextBox0:setTopBottom( 0, 0, 19, 52 )
	TextBox0:setRGB( 0, 0, 0 )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TextBox0:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox0:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox0:setLetterSpacing( 0.6 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.resetProperties = function ()
		GroupMemberSummary:completeAnimation()
		GroupsSummaryStatus0:completeAnimation()
		Line1:completeAnimation()
		Line2:completeAnimation()
		BorderBakedStroke0:completeAnimation()
		GroupEmblemWidget:completeAnimation()
		GroupDescription0:completeAnimation()
		cacItemTitleGlow0:completeAnimation()
		Glow:completeAnimation()
		TextBox0:completeAnimation()
		GroupMemberSummary:setAlpha( 1 )
		GroupsSummaryStatus0:setAlpha( 1 )
		Line1:setAlpha( 1 )
		Line2:setAlpha( 1 )
		BorderBakedStroke0:setAlpha( 1 )
		GroupEmblemWidget:setAlpha( 1 )
		GroupDescription0:setAlpha( 1 )
		cacItemTitleGlow0:setAlpha( 1 )
		Glow:setAlpha( 0.14 )
		TextBox0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoGroupSelected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				GroupMemberSummary:completeAnimation()
				self.GroupMemberSummary:setAlpha( 0 )
				self.clipFinished( GroupMemberSummary, {} )
				GroupsSummaryStatus0:completeAnimation()
				self.GroupsSummaryStatus0:setAlpha( 0 )
				self.clipFinished( GroupsSummaryStatus0, {} )
				Line1:completeAnimation()
				self.Line1:setAlpha( 0 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setAlpha( 0 )
				self.clipFinished( Line2, {} )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 0 )
				self.clipFinished( cacItemTitleGlow0, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				GroupEmblemWidget:completeAnimation()
				self.GroupEmblemWidget:setAlpha( 0 )
				self.clipFinished( GroupEmblemWidget, {} )
				GroupDescription0:completeAnimation()
				self.GroupDescription0:setAlpha( 0 )
				self.clipFinished( GroupDescription0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoGroupSelected",
			condition = function ( menu, element, event )
				return not HasSelectedGroup( element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.GroupMemberSummary:close()
		self.GroupLevelWidget:close()
		self.GroupsSummaryStatus0:close()
		self.GroupsSummaryTBD0:close()
		self.BorderBakedStroke0:close()
		self.cacItemTitleGlow0:close()
		self.GroupEmblemWidget:close()
		self.OwnerName:close()
		self.GroupClanTag:close()
		self.GroupDescription0:close()
		self.TextBox0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

