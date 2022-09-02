-- d2812493d522c68905bfd296a936566a
-- This hash is used for caching, delete to decompile the file again

CoD.GroupLeaderboardTitle = InheritFrom( LUI.UIElement )
CoD.GroupLeaderboardTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupLeaderboardTitle )
	self.id = "GroupLeaderboardTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 520 )
	self:setTopBottom( true, false, 0, 34 )
	
	local Hardcore = LUI.UIText.new()
	Hardcore:setLeftRight( true, true, 0, -15 )
	Hardcore:setTopBottom( false, false, -18, 7 )
	Hardcore:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Hardcore:setText( Engine.Localize( "$(groups.selectedGroup.lbHardcoreString)" ) )
	Hardcore:setTTF( "fonts/escom.ttf" )
	Hardcore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Hardcore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Hardcore )
	self.Hardcore = Hardcore
	
	local TypeAndTimeFrame = LUI.UIText.new()
	TypeAndTimeFrame:setLeftRight( true, true, 0, 0 )
	TypeAndTimeFrame:setTopBottom( false, false, -18, 7 )
	TypeAndTimeFrame:setText( Engine.Localize( "$(groups.selectedGroup.lbTypeString)/$(groups.selectedGroup.lbTimeFrameString)" ) )
	TypeAndTimeFrame:setTTF( "fonts/escom.ttf" )
	TypeAndTimeFrame:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TypeAndTimeFrame:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TypeAndTimeFrame )
	self.TypeAndTimeFrame = TypeAndTimeFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		LeaderboardOptions = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		NoLeaderboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "LeaderboardOptions",
			condition = function ( menu, element, event )
				return HasAdminPrivilege( controller, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_LEADERBOARD ) and not IsGroupLeaderboardAvailable()
			end
		},
		{
			stateName = "NoLeaderboard",
			condition = function ( menu, element, event )
				return not IsGroupLeaderboardAvailable()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbDef" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbDef"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbTimeFrame" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbTimeFrame"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbHardcore" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbHardcore"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.lbInitialized" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.selectedGroup.lbInitialized"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

