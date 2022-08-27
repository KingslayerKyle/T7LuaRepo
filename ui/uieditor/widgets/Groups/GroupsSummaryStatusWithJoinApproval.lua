-- 07df90e4d127931e2e92bb853d3f9d17
-- This hash is used for caching, delete to decompile the file again

CoD.GroupsSummaryStatusWithJoinApproval = InheritFrom( LUI.UIElement )
CoD.GroupsSummaryStatusWithJoinApproval.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 7
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSummaryStatusWithJoinApproval )
	self.id = "GroupsSummaryStatusWithJoinApproval"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 20 )
	
	local GroupPrivacy = LUI.UITightText.new()
	GroupPrivacy:setLeftRight( true, false, 0, 50.88 )
	GroupPrivacy:setTopBottom( true, false, 0, 19 )
	GroupPrivacy:setRGB( 0.52, 0.84, 0.15 )
	GroupPrivacy:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GroupPrivacy:linkToElementModel( self, "privacy", true, function ( model )
		local privacy = Engine.GetModelValue( model )
		if privacy then
			GroupPrivacy:setText( Engine.Localize( GroupPrivacyToString( privacy ) ) )
		end
	end )
	self:addElement( GroupPrivacy )
	self.GroupPrivacy = GroupPrivacy
	
	local JoinApprovalInfo = LUI.UIText.new()
	JoinApprovalInfo:setLeftRight( true, false, 57.88, 320 )
	JoinApprovalInfo:setTopBottom( true, false, 0, 19 )
	JoinApprovalInfo:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	JoinApprovalInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	JoinApprovalInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	JoinApprovalInfo:linkToElementModel( self, "joinApprovalType", true, function ( model )
		local joinApprovalType = Engine.GetModelValue( model )
		if joinApprovalType then
			JoinApprovalInfo:setText( Engine.Localize( GroupJoinApprovalTypeToString( controller, joinApprovalType ) ) )
		end
	end )
	self:addElement( JoinApprovalInfo )
	self.JoinApprovalInfo = JoinApprovalInfo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GroupPrivacy:completeAnimation()
				self.GroupPrivacy:setAlpha( 1 )
				self.clipFinished( GroupPrivacy, {} )
				JoinApprovalInfo:completeAnimation()
				self.JoinApprovalInfo:setAlpha( 1 )
				self.clipFinished( JoinApprovalInfo, {} )
			end
		},
		NoGroupSelected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GroupPrivacy:completeAnimation()
				self.GroupPrivacy:setAlpha( 0 )
				self.clipFinished( GroupPrivacy, {} )
				JoinApprovalInfo:completeAnimation()
				self.JoinApprovalInfo:setAlpha( 0 )
				self.clipFinished( JoinApprovalInfo, {} )
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
	self:linkToElementModel( self, "groupId", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupPrivacy:close()
		element.JoinApprovalInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

