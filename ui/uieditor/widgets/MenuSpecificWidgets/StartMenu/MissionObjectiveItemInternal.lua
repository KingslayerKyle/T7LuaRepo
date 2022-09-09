-- 290a1c351e2df25862629d20d131c00e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveStep" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.getHeightInList = function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0:getModel( f2_arg1, "status" )
		if f2_local0 and Engine.GetModelValue( f2_local0 ) == "done" then
			local f2_local1, f2_local2, f2_local3, f2_local4 = f2_arg0.objectiveName:getLocalRect()
			f2_arg0:setTopBottom( true, false, 0, f2_local4 )
			return f2_local4
		else
			f2_arg0.subobjectivesList:processEvent( {
				name = "child_size_updated"
			} )
			local f2_local1, f2_local2, f2_local3, f2_local4 = f2_arg0.subobjectivesList:getLocalRect()
			f2_arg0:setTopBottom( true, false, 0, f2_local4 )
			return f2_local4
		end
	end
	
	f1_arg0.subobjectivesList:processEvent( {
		name = "child_size_updated"
	} )
end

CoD.MissionObjectiveItemInternal = InheritFrom( LUI.UIElement )
CoD.MissionObjectiveItemInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionObjectiveItemInternal )
	self.id = "MissionObjectiveItemInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 115 )
	self.anyChildUsesUpdateState = true
	
	local objectiveName = LUI.UIText.new()
	objectiveName:setLeftRight( true, true, 0, 0 )
	objectiveName:setTopBottom( true, false, 0, 25 )
	objectiveName:setRGB( 0.57, 0.58, 0.59 )
	objectiveName:setTTF( "fonts/default.ttf" )
	objectiveName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	objectiveName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( objectiveName )
	self.objectiveName = objectiveName
	
	local subobjectivesList = LUI.GridLayout.new( menu, controller, false, 0, 0, 0, 0, nil, nil, false, false, 0, 0, false, true )
	subobjectivesList:setLeftRight( true, false, 2.5, 247.5 )
	subobjectivesList:setTopBottom( true, false, 25, 115 )
	subobjectivesList:setWidgetType( CoD.MissionObjectiveStep )
	subobjectivesList:setVerticalCount( 3 )
	subobjectivesList:setSpacing( 0 )
	self:addElement( subobjectivesList )
	self.subobjectivesList = subobjectivesList
	
	self.objectiveName:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			objectiveName:setText( Engine.Localize( displayText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				objectiveName:completeAnimation()
				self.objectiveName:setRGB( 0.57, 0.58, 0.59 )
				self.clipFinished( objectiveName, {} )

				subobjectivesList:completeAnimation()
				self.subobjectivesList:setAlpha( 1 )
				self.clipFinished( subobjectivesList, {} )
			end
		},
		Done = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				objectiveName:completeAnimation()
				self.objectiveName:setRGB( 0.73, 0.74, 0.75 )
				self.clipFinished( objectiveName, {} )

				subobjectivesList:completeAnimation()
				self.subobjectivesList:setAlpha( 0 )
				self.clipFinished( subobjectivesList, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				objectiveName:completeAnimation()
				self.objectiveName:setRGB( 0.57, 0.58, 0.59 )
				self.clipFinished( objectiveName, {} )

				subobjectivesList:completeAnimation()
				self.subobjectivesList:setAlpha( 1 )
				self.clipFinished( subobjectivesList, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.subobjectivesList:close()
		element.objectiveName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
