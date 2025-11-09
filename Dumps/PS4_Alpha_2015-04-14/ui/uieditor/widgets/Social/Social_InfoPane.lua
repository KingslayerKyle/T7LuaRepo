require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_NotInTitle" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Friendship" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )
require( "ui.uieditor.widgets.Social.Social_Rank" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.Social_InfoPane = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane )
	self.id = "Social_InfoPane"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 745 )
	self:setTopBottom( true, false, 0, 350 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local notInTitle = CoD.Social_InfoPane_Presence_NotInTitle.new( menu, controller )
	notInTitle:setLeftRight( true, false, 1, 410 )
	notInTitle:setTopBottom( true, false, 145, 217 )
	notInTitle:setRGB( 1, 1, 1 )
	notInTitle:linkToElementModel( self, nil, false, function ( model )
		notInTitle:setModel( model, controller )
	end )
	self:addElement( notInTitle )
	self.notInTitle = notInTitle
	
	local presence = CoD.Social_InfoPane_Presence.new( menu, controller )
	presence:setLeftRight( true, false, 0, 410 )
	presence:setTopBottom( true, false, 144, 306 )
	presence:setRGB( 1, 1, 1 )
	presence:linkToElementModel( self, nil, false, function ( model )
		presence:setModel( model, controller )
	end )
	self:addElement( presence )
	self.presence = presence
	
	local SocialInfoPane = LUI.UIFrame.new( menu, controller, 0, 0 )
	SocialInfoPane:setLeftRight( false, true, -760, 0 )
	SocialInfoPane:setTopBottom( true, false, 0, 300 )
	SocialInfoPane:setRGB( 1, 1, 1 )
	SocialInfoPane:setAlpha( 0.5 )
	self:addElement( SocialInfoPane )
	self.SocialInfoPane = SocialInfoPane
	
	local friendship = CoD.Social_InfoPane_Friendship.new( menu, controller )
	friendship:setLeftRight( true, false, 205, 333 )
	friendship:setTopBottom( true, false, 101, 124 )
	friendship:setRGB( 1, 1, 1 )
	friendship:linkToElementModel( self, nil, false, function ( model )
		friendship:setModel( model, controller )
	end )
	self:addElement( friendship )
	self.friendship = friendship
	
	local primaryGroup = LUI.UIText.new()
	primaryGroup:setLeftRight( true, false, 209, 455 )
	primaryGroup:setTopBottom( true, false, 85, 101 )
	primaryGroup:setRGB( 1, 1, 1 )
	primaryGroup:setText( Engine.Localize( "Primary Group: Treyarch" ) )
	primaryGroup:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	primaryGroup:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( primaryGroup )
	self.primaryGroup = primaryGroup
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 3, 200 )
	emblem:setTopBottom( true, false, 2, 133.33 )
	emblem:setRGB( 1, 1, 1 )
	emblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( true, false, 200, 456 )
	callingCard:setTopBottom( true, false, 13, 77 )
	callingCard:setRGB( 1, 1, 1 )
	callingCard:linkToElementModel( self, nil, false, function ( model )
		callingCard:setModel( model, controller )
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	local rankCP = CoD.Social_Rank.new( menu, controller )
	rankCP:setLeftRight( true, false, 464, 548 )
	rankCP:setTopBottom( true, false, 13, 123 )
	rankCP:setRGB( 1, 1, 1 )
	rankCP:setAlpha( 0 )
	rankCP.prestige:setText( Engine.Localize( "" ) )
	rankCP:linkToElementModel( self, "cpRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankCP.level:setText( Engine.Localize( RankToLevelNumber( modelValue, "cp" ) ) )
		end
	end )
	rankCP:linkToElementModel( self, "cpRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankCP.rankIconAdd:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankCP )
	self.rankCP = rankCP
	
	local rankMP = CoD.Social_Rank.new( menu, controller )
	rankMP:setLeftRight( true, false, 556, 640 )
	rankMP:setTopBottom( true, false, 13, 123 )
	rankMP:setRGB( 1, 1, 1 )
	rankMP.prestige:setText( Engine.Localize( "" ) )
	rankMP:linkToElementModel( self, "mpRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.level:setText( Engine.Localize( RankToLevelNumber( modelValue, "mp" ) ) )
		end
	end )
	rankMP:linkToElementModel( self, "mpRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankMP.rankIconAdd:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankMP )
	self.rankMP = rankMP
	
	local rankZM = CoD.Social_Rank.new( menu, controller )
	rankZM:setLeftRight( true, false, 648, 732 )
	rankZM:setTopBottom( true, false, 13, 123 )
	rankZM:setRGB( 1, 1, 1 )
	rankZM:setAlpha( 0 )
	rankZM.prestige:setText( Engine.Localize( "" ) )
	rankZM:linkToElementModel( self, "zmRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.level:setText( Engine.Localize( RankToLevelNumber( modelValue, "zm" ) ) )
		end
	end )
	rankZM:linkToElementModel( self, "zmRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankZM.rankIconAdd:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankZM )
	self.rankZM = rankZM
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, false, 0, 136 )
	StartMenuframenoBG0:setRGB( 1, 1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 198, 202 )
	itemImageLine:setTopBottom( true, false, 134, 0 )
	itemImageLine:setRGB( 1, 1, 1 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				notInTitle:completeAnimation()
				self.notInTitle:setAlpha( 0 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )
			end
		},
		NotInTitle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				notInTitle:completeAnimation()
				self.notInTitle:setAlpha( 1 )
				self.clipFinished( notInTitle, {} )
				presence:completeAnimation()
				self.presence:setAlpha( 0 )
				self.clipFinished( presence, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NotInTitle",
			condition = function ( menu, element, event )
				return not IsInTitle( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "activity", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "activity"
		} )
	end )
	SocialInfoPane.id = "SocialInfoPane"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.SocialInfoPane:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.notInTitle:close()
		self.presence:close()
		self.friendship:close()
		self.callingCard:close()
		self.rankCP:close()
		self.rankMP:close()
		self.rankZM:close()
		self.StartMenuframenoBG0:close()
		self.emblem:close()
		CoD.Social_InfoPane.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

