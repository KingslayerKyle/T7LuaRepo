require( "ui.uieditor.widgets.Social.Social_InfoPane" )

CoD.GroupMemberInfoPane = InheritFrom( LUI.UIElement )
CoD.GroupMemberInfoPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupMemberInfoPane )
	self.id = "GroupMemberInfoPane"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 723 )
	self:setTopBottom( true, false, 0, 485 )
	self.anyChildUsesUpdateState = true
	
	local InfoPane = CoD.Social_InfoPane.new( menu, controller )
	InfoPane:setLeftRight( true, false, -4, 719 )
	InfoPane:setTopBottom( true, false, 5, 490 )
	InfoPane:linkToElementModel( self, nil, false, function ( model )
		InfoPane:setModel( model, controller )
	end )
	InfoPane:linkToElementModel( self, nil, false, function ( model )
		InfoPane.presence:setModel( model, controller )
	end )
	self:addElement( InfoPane )
	self.InfoPane = InfoPane
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				InfoPane:completeAnimation()
				self.InfoPane:setAlpha( 1 )
				self.clipFinished( InfoPane, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				InfoPane:completeAnimation()
				self.InfoPane:setAlpha( 0 )
				self.clipFinished( InfoPane, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return FetchGroupMembersResultsLoading( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupMembersInProgress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupMembersInProgress"
		} )
	end )
	InfoPane.id = "InfoPane"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.InfoPane:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

