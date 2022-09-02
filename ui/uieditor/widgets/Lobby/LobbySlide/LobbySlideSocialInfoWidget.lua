-- af29da83e354f8b53ed1783994f7904f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideSocialInfoJoinable" )

CoD.LobbySlideSocialInfoWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideSocialInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideSocialInfoWidget )
	self.id = "LobbySlideSocialInfoWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 307 )
	self:setTopBottom( true, false, 0, 81 )
	self.anyChildUsesUpdateState = true
	
	local FEListHeaderGlow1 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow1:setLeftRight( true, false, 0, 321 )
	FEListHeaderGlow1:setTopBottom( true, false, 3.75, 61.5 )
	FEListHeaderGlow1:setAlpha( 0.06 )
	self:addElement( FEListHeaderGlow1 )
	self.FEListHeaderGlow1 = FEListHeaderGlow1
	
	local TickTR = LUI.UIImage.new()
	TickTR:setLeftRight( true, false, 313, 349 )
	TickTR:setTopBottom( true, false, 2, 5.5 )
	TickTR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickTR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( TickTR )
	self.TickTR = TickTR
	
	local TickBR = LUI.UIImage.new()
	TickBR:setLeftRight( true, false, 313, 349 )
	TickBR:setTopBottom( true, false, 60, 63.5 )
	TickBR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	TickBR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( TickBR )
	self.TickBR = TickBR
	
	local LineT = LUI.UIImage.new()
	LineT:setLeftRight( true, false, -4, 324 )
	LineT:setTopBottom( true, false, 2, 6 )
	LineT:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineT )
	self.LineT = LineT
	
	local LineB = LUI.UIImage.new()
	LineB:setLeftRight( true, false, -4, 324 )
	LineB:setTopBottom( true, false, 60, 64 )
	LineB:setImage( RegisterImage( "uie_t7_menu_frontend_slidelineblur" ) )
	LineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineB )
	self.LineB = LineB
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( true, false, -29, 7 )
	pixelU0:setTopBottom( false, false, -42.75, -39.25 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -29, 7 )
	Image1:setTopBottom( false, false, 15, 18.5 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local joinable = CoD.LobbySlideSocialInfoJoinable.new( menu, controller )
	joinable:setLeftRight( true, false, 2, 220.1 )
	joinable:setTopBottom( true, false, 30, 54 )
	joinable:linkToElementModel( self, nil, false, function ( model )
		joinable:setModel( model, controller )
	end )
	joinable:mergeStateConditions( {
		{
			stateName = "IsJoinable",
			condition = function ( menu, element, event )
				return IsJoinable( self, controller )
			end
		}
	} )
	joinable:linkToElementModel( joinable, "joinable", true, function ( model )
		menu:updateElementState( joinable, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "joinable"
		} )
	end )
	joinable:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		menu:updateElementState( joinable, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		} )
	end )
	self:addElement( joinable )
	self.joinable = joinable
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, false, 1, 321 )
	FEListHeaderGlow0:setTopBottom( true, false, 4, 24.75 )
	FEListHeaderGlow0:setAlpha( 0.6 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local presence = LUI.UIText.new()
	presence:setLeftRight( true, false, 3, 317.1 )
	presence:setTopBottom( true, false, 5, 23 )
	presence:setRGB( 0, 0, 0 )
	presence:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	presence:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	presence:setShaderVector( 0, 0, 0, 0, 0 )
	presence:setShaderVector( 1, 0, 0, 0, 0 )
	presence:setShaderVector( 2, 1, 0, 0, 0 )
	presence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	presence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	presence:linkToElementModel( self, "partyActivityString", true, function ( model )
		local partyActivityString = Engine.GetModelValue( model )
		if partyActivityString then
			presence:setText( Engine.Localize( partyActivityString ) )
		end
	end )
	self:addElement( presence )
	self.presence = presence
	
	local GroupMember = LUI.UIText.new()
	GroupMember:setLeftRight( true, false, 184, 313 )
	GroupMember:setTopBottom( true, false, 5, 22 )
	GroupMember:setRGB( 0, 0.2, 0.66 )
	GroupMember:setText( Engine.Localize( "MENU_GROUP_MEMBER" ) )
	GroupMember:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GroupMember:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	GroupMember:setShaderVector( 0, 0, 0, 0, 0 )
	GroupMember:setShaderVector( 1, 0, 0, 0, 0 )
	GroupMember:setShaderVector( 2, 1, 0, 0, 0 )
	GroupMember:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	GroupMember:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GroupMember )
	self.GroupMember = GroupMember
	
	local Friend = LUI.UIText.new()
	Friend:setLeftRight( true, false, 184, 313 )
	Friend:setTopBottom( true, false, 5, 22 )
	Friend:setRGB( 0, 0, 0 )
	Friend:setText( Engine.Localize( "MENU_FRIEND" ) )
	Friend:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Friend:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Friend:setShaderVector( 0, 0, 0, 0, 0 )
	Friend:setShaderVector( 1, 0, 0, 0, 0 )
	Friend:setShaderVector( 2, 1, 0, 0, 0 )
	Friend:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Friend:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Friend )
	self.Friend = Friend
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				FEListHeaderGlow1:completeAnimation()
				self.FEListHeaderGlow1:setAlpha( 0 )
				self.clipFinished( FEListHeaderGlow1, {} )

				TickTR:completeAnimation()
				self.TickTR:setAlpha( 0 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setAlpha( 0 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setAlpha( 0 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setAlpha( 0 )
				self.clipFinished( LineB, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 0 )
				self.clipFinished( pixelU0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				joinable:completeAnimation()
				self.joinable:setAlpha( 0 )
				self.clipFinished( joinable, {} )

				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListHeaderGlow0, {} )

				presence:completeAnimation()
				self.presence:setAlpha( 0 )
				self.clipFinished( presence, {} )

				GroupMember:completeAnimation()
				self.GroupMember:setAlpha( 0 )
				self.clipFinished( GroupMember, {} )

				Friend:completeAnimation()
				self.Friend:setAlpha( 0 )
				self.clipFinished( Friend, {} )
			end
		},
		JapaneseFriend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				FEListHeaderGlow1:completeAnimation()
				self.FEListHeaderGlow1:setAlpha( 0.06 )
				self.clipFinished( FEListHeaderGlow1, {} )

				TickTR:completeAnimation()
				self.TickTR:setAlpha( 1 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setAlpha( 1 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setAlpha( 1 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setAlpha( 1 )
				self.clipFinished( LineB, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 1 )
				self.clipFinished( pixelU0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				joinable:completeAnimation()
				self.joinable:setAlpha( 1 )
				self.clipFinished( joinable, {} )

				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0.6 )
				self.clipFinished( FEListHeaderGlow0, {} )

				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )

				GroupMember:completeAnimation()
				self.GroupMember:setAlpha( 0 )
				self.clipFinished( GroupMember, {} )

				Friend:completeAnimation()
				self.Friend:setAlpha( 0 )
				self.clipFinished( Friend, {} )
			end
		},
		JapaneseGroupMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				FEListHeaderGlow1:completeAnimation()
				self.FEListHeaderGlow1:setAlpha( 0.06 )
				self.clipFinished( FEListHeaderGlow1, {} )

				TickTR:completeAnimation()
				self.TickTR:setAlpha( 1 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setAlpha( 1 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setAlpha( 1 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setAlpha( 1 )
				self.clipFinished( LineB, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 1 )
				self.clipFinished( pixelU0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				joinable:completeAnimation()
				self.joinable:setAlpha( 1 )
				self.clipFinished( joinable, {} )

				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0.6 )
				self.clipFinished( FEListHeaderGlow0, {} )

				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )

				GroupMember:completeAnimation()
				self.GroupMember:setAlpha( 0 )
				self.clipFinished( GroupMember, {} )

				Friend:completeAnimation()
				self.Friend:setAlpha( 0 )
				self.clipFinished( Friend, {} )
			end
		},
		Friend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				FEListHeaderGlow1:completeAnimation()
				self.FEListHeaderGlow1:setAlpha( 0.06 )
				self.clipFinished( FEListHeaderGlow1, {} )

				TickTR:completeAnimation()
				self.TickTR:setAlpha( 1 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setAlpha( 1 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setAlpha( 1 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setAlpha( 1 )
				self.clipFinished( LineB, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 1 )
				self.clipFinished( pixelU0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				joinable:completeAnimation()
				self.joinable:setAlpha( 1 )
				self.clipFinished( joinable, {} )

				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0.6 )
				self.clipFinished( FEListHeaderGlow0, {} )

				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )

				GroupMember:completeAnimation()
				self.GroupMember:setAlpha( 0 )
				self.clipFinished( GroupMember, {} )

				Friend:completeAnimation()
				self.Friend:setAlpha( 1 )
				self.clipFinished( Friend, {} )
			end
		},
		GroupMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				FEListHeaderGlow1:completeAnimation()
				self.FEListHeaderGlow1:setAlpha( 0.06 )
				self.clipFinished( FEListHeaderGlow1, {} )

				TickTR:completeAnimation()
				self.TickTR:setAlpha( 1 )
				self.clipFinished( TickTR, {} )

				TickBR:completeAnimation()
				self.TickBR:setAlpha( 1 )
				self.clipFinished( TickBR, {} )

				LineT:completeAnimation()
				self.LineT:setAlpha( 1 )
				self.clipFinished( LineT, {} )

				LineB:completeAnimation()
				self.LineB:setAlpha( 1 )
				self.clipFinished( LineB, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 1 )
				self.clipFinished( pixelU0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )

				joinable:completeAnimation()
				self.joinable:setAlpha( 1 )
				self.clipFinished( joinable, {} )

				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0.6 )
				self.clipFinished( FEListHeaderGlow0, {} )

				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )

				GroupMember:completeAnimation()
				self.GroupMember:setAlpha( 1 )
				self.clipFinished( GroupMember, {} )

				Friend:completeAnimation()
				self.Friend:setAlpha( 0 )
				self.clipFinished( Friend, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "JapaneseFriend",
			condition = function ( menu, element, event )
				local f12_local0 = IsSelfModelValueTrue( element, controller, "quickjoinListMember" )
				if f12_local0 then
					if not IsSelfModelValueNil( element, controller, "xuid" ) then
						f12_local0 = IsSelfModelValueTrue( element, controller, "friend" )
						if f12_local0 then
							f12_local0 = IsCurrentLanguageJapanese()
						end
					else
						f12_local0 = false
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "JapaneseGroupMember",
			condition = function ( menu, element, event )
				local f13_local0 = IsSelfModelValueTrue( element, controller, "quickjoinListMember" )
				if f13_local0 then
					if not IsSelfModelValueNil( element, controller, "xuid" ) and not IsSelfModelValueTrue( element, controller, "friend" ) then
						f13_local0 = IsCurrentLanguageJapanese()
					else
						f13_local0 = false
					end
				end
				return f13_local0
			end
		},
		{
			stateName = "Friend",
			condition = function ( menu, element, event )
				local f14_local0 = IsSelfModelValueTrue( element, controller, "quickjoinListMember" )
				if f14_local0 then
					if not IsSelfModelValueNil( element, controller, "xuid" ) then
						f14_local0 = IsSelfModelValueTrue( element, controller, "friend" )
					else
						f14_local0 = false
					end
				end
				return f14_local0
			end
		},
		{
			stateName = "GroupMember",
			condition = function ( menu, element, event )
				local f15_local0 = IsSelfModelValueTrue( element, controller, "quickjoinListMember" )
				if f15_local0 then
					if not IsSelfModelValueNil( element, controller, "xuid" ) then
						f15_local0 = not IsSelfModelValueTrue( element, controller, "friend" )
					else
						f15_local0 = false
					end
				end
				return f15_local0
			end
		}
	} )
	self:linkToElementModel( self, "quickjoinListMember", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "quickjoinListMember"
		} )
	end )
	self:linkToElementModel( self, "xuid", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "xuid"
		} )
	end )
	self:linkToElementModel( self, "friend", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "friend"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListHeaderGlow1:close()
		element.joinable:close()
		element.FEListHeaderGlow0:close()
		element.presence:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

