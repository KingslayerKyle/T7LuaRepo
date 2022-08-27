-- c8f48122202733cd99d030b0e62e4ef4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_MeterFill0" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_MeterFill1" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_MeterFill2" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_MeterFill3" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_MeterFill4" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_MeterFillBlast" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_TitleReady" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_Meter1" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_Meter2" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLuancherSpikeCounter_Meter3" )

CoD.SpikeLuancherSpikeCounter_Internal = InheritFrom( LUI.UIElement )
CoD.SpikeLuancherSpikeCounter_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLuancherSpikeCounter_Internal )
	self.id = "SpikeLuancherSpikeCounter_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 400 )
	self.anyChildUsesUpdateState = true
	
	local ImgMain = LUI.UIImage.new()
	ImgMain:setLeftRight( true, true, 0, 0 )
	ImgMain:setTopBottom( true, true, 0, 0 )
	ImgMain:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelaunchercounter_main" ) )
	self:addElement( ImgMain )
	self.ImgMain = ImgMain
	
	local MeterFill0 = CoD.SpikeLuancherSpikeCounter_MeterFill0.new( menu, controller )
	MeterFill0:setLeftRight( true, false, 74, 186 )
	MeterFill0:setTopBottom( true, false, 272, 400 )
	MeterFill0:linkToElementModel( self, nil, false, function ( model )
		MeterFill0:setModel( model, controller )
	end )
	MeterFill0:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "spikesReady", 0 )
			end
		}
	} )
	MeterFill0:linkToElementModel( MeterFill0, "blasting", true, function ( model )
		menu:updateElementState( MeterFill0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	MeterFill0:linkToElementModel( MeterFill0, "spikesReady", true, function ( model )
		menu:updateElementState( MeterFill0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( MeterFill0 )
	self.MeterFill0 = MeterFill0
	
	local MeterFill1 = CoD.SpikeLuancherSpikeCounter_MeterFill1.new( menu, controller )
	MeterFill1:setLeftRight( true, false, 74, 186 )
	MeterFill1:setTopBottom( true, false, 272, 400 )
	MeterFill1:linkToElementModel( self, nil, false, function ( model )
		MeterFill1:setModel( model, controller )
	end )
	MeterFill1:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "spikesReady", 1 )
			end
		}
	} )
	MeterFill1:linkToElementModel( MeterFill1, "blasting", true, function ( model )
		menu:updateElementState( MeterFill1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	MeterFill1:linkToElementModel( MeterFill1, "spikesReady", true, function ( model )
		menu:updateElementState( MeterFill1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( MeterFill1 )
	self.MeterFill1 = MeterFill1
	
	local MeterFill2 = CoD.SpikeLuancherSpikeCounter_MeterFill2.new( menu, controller )
	MeterFill2:setLeftRight( true, false, 74, 186 )
	MeterFill2:setTopBottom( true, false, 272, 400 )
	MeterFill2:linkToElementModel( self, nil, false, function ( model )
		MeterFill2:setModel( model, controller )
	end )
	MeterFill2:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "spikesReady", 2 )
			end
		}
	} )
	MeterFill2:linkToElementModel( MeterFill2, "blasting", true, function ( model )
		menu:updateElementState( MeterFill2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	MeterFill2:linkToElementModel( MeterFill2, "spikesReady", true, function ( model )
		menu:updateElementState( MeterFill2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( MeterFill2 )
	self.MeterFill2 = MeterFill2
	
	local MeterFill3 = CoD.SpikeLuancherSpikeCounter_MeterFill3.new( menu, controller )
	MeterFill3:setLeftRight( true, false, 74, 186 )
	MeterFill3:setTopBottom( true, false, 272, 400 )
	MeterFill3:linkToElementModel( self, nil, false, function ( model )
		MeterFill3:setModel( model, controller )
	end )
	MeterFill3:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "spikesReady", 3 )
			end
		}
	} )
	MeterFill3:linkToElementModel( MeterFill3, "blasting", true, function ( model )
		menu:updateElementState( MeterFill3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	MeterFill3:linkToElementModel( MeterFill3, "spikesReady", true, function ( model )
		menu:updateElementState( MeterFill3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( MeterFill3 )
	self.MeterFill3 = MeterFill3
	
	local MeterFill4 = CoD.SpikeLuancherSpikeCounter_MeterFill4.new( menu, controller )
	MeterFill4:setLeftRight( true, false, 74, 186 )
	MeterFill4:setTopBottom( true, false, 272, 400 )
	MeterFill4:linkToElementModel( self, nil, false, function ( model )
		MeterFill4:setModel( model, controller )
	end )
	MeterFill4:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "spikesReady", 4 )
			end
		}
	} )
	MeterFill4:linkToElementModel( MeterFill4, "blasting", true, function ( model )
		menu:updateElementState( MeterFill4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	MeterFill4:linkToElementModel( MeterFill4, "spikesReady", true, function ( model )
		menu:updateElementState( MeterFill4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( MeterFill4 )
	self.MeterFill4 = MeterFill4
	
	local MeterBlast = CoD.SpikeLuancherSpikeCounter_MeterFillBlast.new( menu, controller )
	MeterBlast:setLeftRight( true, false, 74, 186 )
	MeterBlast:setTopBottom( true, false, 272, 400 )
	MeterBlast:linkToElementModel( self, nil, false, function ( model )
		MeterBlast:setModel( model, controller )
	end )
	MeterBlast:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	MeterBlast:linkToElementModel( MeterBlast, "blasting", true, function ( model )
		menu:updateElementState( MeterBlast, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	self:addElement( MeterBlast )
	self.MeterBlast = MeterBlast
	
	local TitleReady = CoD.SpikeLuancherSpikeCounter_TitleReady.new( menu, controller )
	TitleReady:setLeftRight( true, false, 14, 262 )
	TitleReady:setTopBottom( true, false, 46, 238 )
	TitleReady:linkToElementModel( self, nil, false, function ( model )
		TitleReady:setModel( model, controller )
	end )
	TitleReady:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "spikesReady", 1 )
			end
		}
	} )
	TitleReady:linkToElementModel( TitleReady, "blasting", true, function ( model )
		menu:updateElementState( TitleReady, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	TitleReady:linkToElementModel( TitleReady, "spikesReady", true, function ( model )
		menu:updateElementState( TitleReady, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( TitleReady )
	self.TitleReady = TitleReady
	
	local Meter1 = CoD.SpikeLuancherSpikeCounter_Meter1.new( menu, controller )
	Meter1:setLeftRight( true, false, 208, 400 )
	Meter1:setTopBottom( true, false, 0, 64 )
	Meter1:linkToElementModel( self, nil, false, function ( model )
		Meter1:setModel( model, controller )
	end )
	Meter1:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "spikesReady", 1 )
			end
		}
	} )
	Meter1:linkToElementModel( Meter1, "blasting", true, function ( model )
		menu:updateElementState( Meter1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	Meter1:linkToElementModel( Meter1, "spikesReady", true, function ( model )
		menu:updateElementState( Meter1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( Meter1 )
	self.Meter1 = Meter1
	
	local Meter2 = CoD.SpikeLuancherSpikeCounter_Meter1.new( menu, controller )
	Meter2:setLeftRight( true, false, 208, 400 )
	Meter2:setTopBottom( true, false, 324, 388 )
	Meter2:setXRot( -180 )
	Meter2:linkToElementModel( self, nil, false, function ( model )
		Meter2:setModel( model, controller )
	end )
	Meter2:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "spikesReady", 2 )
			end
		}
	} )
	Meter2:linkToElementModel( Meter2, "blasting", true, function ( model )
		menu:updateElementState( Meter2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	Meter2:linkToElementModel( Meter2, "spikesReady", true, function ( model )
		menu:updateElementState( Meter2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( Meter2 )
	self.Meter2 = Meter2
	
	local Meter3 = CoD.SpikeLuancherSpikeCounter_Meter2.new( menu, controller )
	Meter3:setLeftRight( true, false, 232, 400 )
	Meter3:setTopBottom( true, false, 47, 135 )
	Meter3:linkToElementModel( self, nil, false, function ( model )
		Meter3:setModel( model, controller )
	end )
	Meter3:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "spikesReady", 3 )
			end
		}
	} )
	Meter3:linkToElementModel( Meter3, "blasting", true, function ( model )
		menu:updateElementState( Meter3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	Meter3:linkToElementModel( Meter3, "spikesReady", true, function ( model )
		menu:updateElementState( Meter3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( Meter3 )
	self.Meter3 = Meter3
	
	local Meter4 = CoD.SpikeLuancherSpikeCounter_Meter2.new( menu, controller )
	Meter4:setLeftRight( true, false, 232, 400 )
	Meter4:setTopBottom( true, false, 253, 341 )
	Meter4:setXRot( -180 )
	Meter4:linkToElementModel( self, nil, false, function ( model )
		Meter4:setModel( model, controller )
	end )
	Meter4:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "spikesReady", 4 )
			end
		}
	} )
	Meter4:linkToElementModel( Meter4, "blasting", true, function ( model )
		menu:updateElementState( Meter4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	Meter4:linkToElementModel( Meter4, "spikesReady", true, function ( model )
		menu:updateElementState( Meter4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( Meter4 )
	self.Meter4 = Meter4
	
	local Meter5 = CoD.SpikeLuancherSpikeCounter_Meter3.new( menu, controller )
	Meter5:setLeftRight( true, false, 312, 400 )
	Meter5:setTopBottom( true, false, 106.5, 282.5 )
	Meter5:linkToElementModel( self, nil, false, function ( model )
		Meter5:setModel( model, controller )
	end )
	Meter5:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "spikesReady", 5 )
			end
		}
	} )
	Meter5:linkToElementModel( Meter5, "blasting", true, function ( model )
		menu:updateElementState( Meter5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	Meter5:linkToElementModel( Meter5, "spikesReady", true, function ( model )
		menu:updateElementState( Meter5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	self:addElement( Meter5 )
	self.Meter5 = Meter5
	
	self:mergeStateConditions( {
		{
			stateName = "Blasting",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "blasting" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "spikesReady", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "blasting", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blasting"
		} )
	end )
	self:linkToElementModel( self, "spikesReady", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "spikesReady"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MeterFill0:close()
		element.MeterFill1:close()
		element.MeterFill2:close()
		element.MeterFill3:close()
		element.MeterFill4:close()
		element.MeterBlast:close()
		element.TitleReady:close()
		element.Meter1:close()
		element.Meter2:close()
		element.Meter3:close()
		element.Meter4:close()
		element.Meter5:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

